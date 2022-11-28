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
        
        public var params: any View {
            Params()
        }
        
        public var colors: any View {
            Colors()
        }
        
        public var status: any View {
            Status()
        }
        
        public var documentation: String {
            return Documentation(model: model.wrappedValue).getValue()
        }
        
        public init() {}
    }
}
