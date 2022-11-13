//
//  TagRow.swift
//  Prism
//
//  Created by Joey BARBIER on 13/11/2022.
//

import SwiftUI

extension Tag {
    struct Row: View {
        var tag: Tag
        
        var body: some View {
            HStack {
                tag.image
                Text(tag.title)
            }
        }
    }
}

struct TagRow_Previews: PreviewProvider {
    static var previews: some View {
        let tag = Tag(id: "button",
                      title: "button",
                      image: .init(systemName: ""))
        Tag.Row(tag: tag)
    }
}
