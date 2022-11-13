//
//  PrismButtonLoader_Demo.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 12/11/2022.
//

import SwiftUI

// MARK: - DEMO
extension Prism.Button.Loader {
    public struct Demo: PrismDemoView {
        public var model: ObservedObject<Model> = ObservedObject(initialValue: Model())
        
        public var preview: any View {
            Preview()
        }
        public var controls: any View {
            Controls()
        }
        public var colors: any View {
            Colors()
        }
                
        public init() {}
    }
}
