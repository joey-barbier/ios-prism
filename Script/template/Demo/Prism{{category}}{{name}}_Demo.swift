//
//  Prism{{category}}{{name}}_Demo.swift
//  OrkaPrism
//
//  Created by Orka.
//

import SwiftUI

// MARK: - DEMO
extension Prism.{{category}}.{{name}} {
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
