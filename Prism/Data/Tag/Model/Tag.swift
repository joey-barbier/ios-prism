//
//  Tag.swift
//  Prism
//
//  Created by Joey BARBIER on 11/05/2021.
//

import SwiftUI

struct Tag: Identifiable {
    var id: String
    var title: String
    var image: Image
}

extension Tag {
    static let all: [Tag] = [
        .button,
    ]
    
    init?(for id: Tag.ID) {
        guard let result = Tag.all.first(where: { $0.id == id }) else {
            return nil
        }
        self = result
    }
    
    static func getAllOrdering() -> [Tag] {
        return all.sorted(by: {$0.title < $1.title})
    }
}
