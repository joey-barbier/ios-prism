//
//  Prism{{category}}{{name}}_Demo.swift
//  OrkaPrism
//
//  Created by Orka.
//

import SwiftUI

extension Prism.{{category}}.{{name}}.Demo {
    struct Preview: View {
        @EnvironmentObject var model: Model
    }
}

extension Prism.{{category}}.{{name}}.Demo.Preview {
    var body: some View {
        VStack {
            Prism.{{category}}.{{name}}()
        }
    }
}
