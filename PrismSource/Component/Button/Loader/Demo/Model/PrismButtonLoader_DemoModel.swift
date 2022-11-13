//
//  PrismButtonLoader_DemoModel.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 13/11/2022.
//

import SwiftUI

extension Prism.Button.Loader.Demo {
    public class Model: PrismDemoModel {
        @Published public var isLoading: Bool = false
        @Published public var width: String = "250"
        @Published public var height: String = "55"
        @Published public var cornerRadius: String = "8"
        @Published public var textColor: Color = .white
        @Published public var backgroundColor: Color = Color(#colorLiteral(red: 0.5266463229, green: 0.3556309824, blue: 1, alpha: 1))
        @Published public var loadingColor: Color = Color(#colorLiteral(red: 0.2185284262, green: 0.147566736, blue: 0.4149434198, alpha: 1))
        @Published public var strokeWidth: String = "5"
        @Published public var strokeColor: Color = .white
        @Published public var title: String = "Télécharger"
    }
}
