//
//
// Based on : https://github.com/Changemin/LoadingButton
//

import SwiftUI

extension Prism.Button {
    public struct Loader: View {
        @Binding var isLoading: Bool
        var style: Style
        let content: AnyView
        var action: () -> () = {}
        
        public init(action: @escaping () -> Void,
                    isLoading: Binding<Bool>,
                    style: Style? = nil,
                    @ViewBuilder builder: () -> any View)
        {
            self._isLoading = isLoading
            self.style = style ?? Style()
            content = AnyView(builder())
            self.action = action
        }
    }
}

extension Prism.Button.Loader {
    public var body: some View {
        Button(action: {
            if !isLoading {
                action()
            }
            isLoading = true
        }) {
            ZStack {
                Rectangle()
                    .fill(isLoading ? style.loadingBackgroundColor : style.backgroundColor)
                    .frame(width: isLoading ? style.height : style.width, height: style.height)
                    .cornerRadius(isLoading ? style.height/2 : style.cornerRadius)
                    .animation(.easeInOut)
                
                if isLoading {
                    CircleLoadingBar(style: style)
                } else {
                    VStack {
                        content.animation(.easeInOut)
                    }
                }
            }
        }.frame(width: style.width, height: style.height)
    }
}
