//
//  PrismButtonLoader_Demo.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 12/11/2022.
//

import SwiftUI

extension Prism.Button.Loader.Demo {
    struct Params: View {
        @EnvironmentObject var model: Model
    }
}

extension Prism.Button.Loader.Demo.Params {
    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Titre du bouton :")
                    .font(.subheadline)
                TextField("", text: $model.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Largeur :")
                    .font(.subheadline)
                TextField(model.width, text: $model.width)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Hauteur :")
                    .font(.subheadline)
                TextField(model.height, text: $model.height)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Corner radius :")
                    .font(.subheadline)
                TextField("", text: $model.cornerRadius)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Taille du trait :")
                    .font(.subheadline)
                TextField("", text: $model.strokeWidth)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
        }
    }
}
