//
//  ComponentDetails.swift
//  Prism
//
//  Created by Joey BARBIER on 12/05/2021.
//

import SwiftUI
import OrkaPrism

extension Component {
    struct DetailView: View {
        var component: Component
    }
}

extension Component.DetailView {
    var body: some View {
        VStack {
            AnyView(component.preview)
            Spacer()
        }
        .padding()
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle("\(component.title)", displayMode: .automatic)
    }
}

struct ComponentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Component.DetailView(component: Component.Button.loader)
    }
}
