//
//  Prism.swift
//  PrismUI
//
//  Created by Joey BARBIER on 12/11/2022.
//

import Foundation
import SwiftUI

public class Prism {
    public class Button: Tag {
        public var id: String      { return "Button"}
        public var title: String   { return "Bouton" }
        public var image: Image    { return Image(systemName: "rectangle.and.hand.point.up.left.fill")}
    }
}

extension Prism {
    static let allTags: [any Tag] = [
        Prism.Button(),
    ]
    
    static func getAllOrdering() -> [any Tag] {
        return allTags.sorted(by: {$0.title < $1.title})
    }
}
