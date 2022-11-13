//
//  ComponentRow.swift
//  Prism
//
//  Created by Joey BARBIER on 13/11/2022.
//

import SwiftUI

extension Component {
    struct Row: View {
        var component: Component
        var tags: String {
            let items = component.tags.map({"\($0.title) "})
            return items.joined()
        }
    }
}

extension Component.Row {
    var body: some View {
        VStack {
            component.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100,
                       maxHeight: 100)
            
            Text("\(tags)")
                .font(.headline)
                .foregroundColor(.secondary)
            Text(component.title)
                .font(.headline)
                .fontWeight(.black)
                .foregroundColor(.primary)
        }
    }
}

struct ComponentRow_Previews: PreviewProvider {
    static var previews: some View {
        Component.Row(component: Component.Button.loader)
    }
}
