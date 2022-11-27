//
//  PrismButtonLoader_Demo+State.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 15/11/2022.
//

import SwiftUI

extension Prism.Button.Loader.Demo {
    struct Status: View {
        @EnvironmentObject var model: Model
    }
}

extension Prism.Button.Loader.Demo.Status {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Choix de l'état :")
            
            HStack(spacing: 28) {
                Button {
                    model.isLoading = false
                } label: {
                    Text("Par default")
                }
                .padding(.all, 16)
                .background(Color.white)
                .cornerRadius(8)
                
                Divider()
                
                Button {
                    model.isLoading = true
                } label: {
                    Text("En téléchargement")
                }
                .padding(.all, 16)
                .background(Color.white)
                .cornerRadius(8)
            }
        }
    }
}

struct PrismButtonLoader_Demo_State_Previews: PreviewProvider {
    static var previews: some View {
        Prism.Button.Loader.Demo()
    }
}
