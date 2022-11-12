//
//  Component+Button.swift
//  Prism
//
//  Created by Joey BARBIER on 03/11/2021.
//

import SwiftUI
import OrkaPrism

extension Component {
    class Button {
        static let loader = Component(id: "PrismButtonLoader", // id = class name
                                      title: "Bouton avec chargement",
                                      image: Image(systemName: "circle.dotted"),
                                      preview: Prism.Button.Loader.Demo(),
                                      tags: [.button])
        
    }
}
