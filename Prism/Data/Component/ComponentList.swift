//
//  ComponentList.swift
//  Prism
//
//  Created by Joey BARBIER on 11/05/2021.
//

import SwiftUI

struct ComponentCell: View {
    var component: Component
    var tags: String {
        let items = component.tags.map({"\($0.title) "})
        return items.joined()
    }
    
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

struct ComponentList: View {
    var components: [Component]
    var columns: Int {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 4
        }
        return 2
    }
    @State private var selection: Component.ID?
    
    var body: some View {
        VStack {
            UIGrid(columns: columns, list: components) { component in
                Section {
                    NavigationLink(destination: ComponentDetailView(component: component), tag: component.id, selection: $selection)
                    {
                        Spacer()
                        ComponentCell(component: component)
                        Spacer()
                    }
                }
            }
            Spacer()
        }
    }
}

struct ComponentList_Previews: PreviewProvider {
    static var previews: some View {
        ComponentList(components: Component.all)
    }
}
