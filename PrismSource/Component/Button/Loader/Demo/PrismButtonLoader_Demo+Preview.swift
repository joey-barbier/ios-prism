//
//  PrismButtonLoader_Demo.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 12/11/2022.
//

import SwiftUI

extension Prism.Button.Loader.Demo {
    struct Preview: View {
        @EnvironmentObject var model: Model
        
        var body: some View {
            VStack {
                Prism.Button.Loader(action: {},
                                    isLoading: $model.isLoading,
                                    style: Prism.Button.Loader.Style(width: NumberFormatter().number(from: model.width) as? CGFloat,
                                                                     height: NumberFormatter().number(from: model.height) as? CGFloat,
                                                                     cornerRadius: NumberFormatter().number(from: model.cornerRadius) as? CGFloat,
                                                                     backgroundColor: model.backgroundColor,
                                                                     loadingColor: model.loadingColor,
                                                                     strokeWidth: NumberFormatter().number(from: model.strokeWidth) as? CGFloat,
                                                                     strokeColor: model.strokeColor),
                                    builder: {
                    Text(model.title)
                        .foregroundColor(model.textColor)
                })
                Button {
                    model.isLoading = false
                } label: {
                    Text("Arrêter le chargement")
                }
            }
        }
    }
}
