//
//  CategoriesList.swift
//  Prism
//
//  Created by Joey BARBIER on 11/05/2021.
//

import SwiftUI

extension Tag {
    struct List: View {
        var tags = Tag.getAllOrdering()
        @Binding var selected: Tag
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            NavigationView {
                SwiftUI.List(tags) { tag in
                    Button(action: {
                        selected = tag
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Tag.Row(tag: tag)
                    }
                }
                .navigationBarTitle("Tags")
            }
        }
    }
}

struct TagList_Previews: PreviewProvider {
    static var previews: some View {
        let tag = Tag(id: "button",
                      title: "button",
                      image: .init(systemName: ""))
        Tag.List(selected: .constant(tag))
    }
}
