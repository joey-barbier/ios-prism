//
//  WebView.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 21/11/2022.
//

import Foundation
import SwiftUI
import Combine
import WebKit
import Combine

struct WebView: View {
    let htmlName: String
    let htmlBody: String
    @State var height: CGFloat = 0

    var body: some View {
        WebViewWrapper(htmlName: htmlName,
                       htmlBody: htmlBody,
                       height: $height)
        .frame(height: height)
        .padding(.bottom, 24)
    }
}

struct WebViewWrapper: UIViewRepresentable {
    let htmlName: String
    let htmlBody: String
    @Binding var height: CGFloat
    internal var webview: WKWebView = WKWebView()
        
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webview.scrollView.bounces = false
        webview.scrollView.isScrollEnabled = false
        webview.navigationDelegate = context.coordinator
        let htmlStr = getHtml()
        webview.loadHTMLString(htmlStr, baseURL: nil)
        // update height
        webview.bounds.size.height = webview.scrollView.contentSize.height
        DispatchQueue.main.async {
            height = webview.scrollView.contentSize.height
        }
        
        return webview
    }
    
    func getHtml() -> String {
        guard let path = Prism.resourceBundle?.path(forResource: htmlName, ofType: "html"),
              var html = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else {return ""}
        
        let pathCss = Prism.resourceBundle?.path(forResource: "documentation", ofType: "css") ?? ""
        let pathJs = Prism.resourceBundle?.path(forResource: "documentation", ofType: "js") ?? ""
        let js = try? String(contentsOfFile: pathJs, encoding: String.Encoding.utf8)
        let css = try? String(contentsOfFile: pathCss, encoding: String.Encoding.utf8)
        
        html = html.replacingOccurrences(of: "{{style}}", with: css ?? "")
        html = html.replacingOccurrences(of: "{{js}}", with: js ?? "")
        html = html.replacingOccurrences(of: "{{body}}", with: htmlBody)

        return html
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        DispatchQueue.main.async {
            if uiView.scrollView.contentSize.height != webview.bounds.size.height {
                height = uiView.scrollView.contentSize.height
            }
        }
    }
    
    // MARK: - Coordinator
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewWrapper
        var observation: NSKeyValueObservation?
        
        init(_ parent: WebViewWrapper) {
            self.parent = parent
            super.init()
                        
            observation = self.parent.webview.observe(\.scrollView.contentSize) { [weak self] webview, change in
                guard let self = self, change.oldValue != change.newValue  else {return}
                self.updateWebViewHeight()
            }
        }
        
        func webView(_ webView: WKWebView,
                     didFinish navigation: WKNavigation!)
        {
            updateWebViewHeight()
        }
        
        func updateWebViewHeight() {
            parent.webview.evaluateJavaScript("document.getElementById(\"anchor-bottom\").getBoundingClientRect().bottom", completionHandler: { (height, error) in
                DispatchQueue.main.async {
                    guard let height = height as? CGFloat else {return}
                    self.parent.height = height
                }
            })
        }
    }
}

