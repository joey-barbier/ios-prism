//
//  ComponentList.swift
//  Prism
//
//  Created by Joey BARBIER on 11/05/2021.
//

import SwiftUI


extension Component {
    struct List: View {
        var components: [Component]
        var columns: Int {
            if UIDevice.current.userInterfaceIdiom == .pad {
                return 4
            }
            return 2
        }
        @State private var selection: Component.ID?
    }
}

extension Component.List {
    var body: some View {
        VStack {
            UIGrid(columns: columns, list: components) { component in
                Section {
                    NavigationLink(destination: Component.DetailView(component: component),
                                   tag: component.id,
                                   selection: $selection)
                    {
                        Spacer()
                        Component.Row(component: component)
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
        Component.List(components: Component.all)
    }
}
