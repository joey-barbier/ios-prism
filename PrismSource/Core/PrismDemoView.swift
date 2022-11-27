//
//  PrismDemoView.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 15/11/2022.
//

import SwiftUI

public protocol PrismDemoView: View {
    associatedtype T: PrismDemoModel
    
    var preview: any View {get}
    var params: any View {get}
    var colors: any View {get}
    var status: any View {get}
    var documentation: String {get}
    var model: ObservedObject<T> {get set}
}

extension PrismDemoView {
    @ViewBuilder
    public var body: some View {
        ScrollView {
            VStack {
                AnyView(preview)
                    .environmentObject(model.wrappedValue)
                    .padding(.top, 64)
                    .padding(.bottom, 52)
                
                Picker("Menu", selection: model.projectedValue.menuSelected) {
                    Text("États").tag(PrismDemoModel.Menu.status)
                    Text("Paramètres").tag(PrismDemoModel.Menu.params)
                    Text("Couleurs").tag(PrismDemoModel.Menu.colors)
                    Text("Documentation").tag(PrismDemoModel.Menu.documentation)
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 52)
                
                switch model.wrappedValue.menuSelected {
                case .params:
                    AnyView(params)
                        .environmentObject(model.wrappedValue)
                case .colors:
                    AnyView(colors)
                        .environmentObject(model.wrappedValue)
                case .status:
                    AnyView(status)
                        .environmentObject(model.wrappedValue)
                case .documentation:
                    VStack {
                        WebView(htmlName: "documentation",
                                htmlBody: documentation)
                    }
                }
            }
            .padding(.bottom, 64)
        }
    }
}
