//
//  Prism{{category}}{{name}}_Demo+State.swift
//  OrkaPrism
//
//  Created by Orka.
//

import SwiftUI

extension Prism.{{category}}.{{name}}.Demo {
    struct Status: View {
        @EnvironmentObject var model: Model
    }
}

extension Prism.{{category}}.{{name}}.Demo.Status {
    var body: some View {
        EmptyView()
    }
}

struct Prism{{category}}{{name}}_Demo_State_Previews: PreviewProvider {
    static var previews: some View {
        Prism.{{category}}.{{name}}.Demo()
    }
}
