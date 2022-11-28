//
//  PrismButtonLoader_Demo.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 12/11/2022.
//

import SwiftUI

extension Prism.Button.Loader.Demo {
    struct Colors: View {
        @EnvironmentObject var model: Model
    }
}

extension Prism.Button.Loader.Demo.Colors {
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Couleur de fond :")
                .font(.subheadline)
            ColorPicker("", selection: $model.backgroundColor)
                .frame(height: 65)
        }
        
        Divider()
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Couleur de chargement :")
                .font(.subheadline)
            ColorPicker("", selection: $model.loadingColor)
                .frame(height: 65)
        }
        
        Divider()
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Couleur du trait :")
                .font(.subheadline)
            ColorPicker("", selection: $model.strokeColor)
                .frame(height: 65)
        }
    }
}
