//
//  ComponentDetails.swift
//  Prism
//
//  Created by Joey BARBIER on 12/05/2021.
//

import SwiftUI
import OrkaPrism

struct ComponentDetailView: View {
    var component: Component
    
    init(component: Component) {
        self.component = component
    }
    
    var body: some View {
        VStack {
            Prism.Button.Loader.Demo()
            Spacer()
            //preview.getControls()
            //Prism.Button.Loader.Demo.demo.bodyControls
        }
        .padding()
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle("\(component.title)", displayMode: .automatic)
    }
}

struct ComponentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentDetailView(component: Component.Button.loader)
    }
}
