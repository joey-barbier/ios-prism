//
//  Component.swift
//  Prism
//
//  Created by Joey BARBIER on 11/05/2021.
//

import SwiftUI
import OrkaPrism

struct Component: Identifiable, Hashable {
    static func == (lhs: Component, rhs: Component) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String
    var title: String
    var image: Image
    var preview: any View
    var tags: [Tag]
}

extension Component {
    static let all: [Component] = [
        Button.loader,
    ]
    
    init?(for id: Component.ID) {
        guard let result = Component.all.first(where: { $0.id == id }) else {
            return nil
        }
        self = result
    }
}
