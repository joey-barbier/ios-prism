//
//  ContentView.swift
//  Prism
//
//  Created by Joey BARBIER on 10/05/2021.
//

import SwiftUI

struct HomeView: View {
    @State var tagSelected: Tag = Tag.button
    @State var showSheetView = false
    
    var body: some View {
        NavigationView {
            Component.List(components: getComponent())
                .navigationBarItems(leading: Button(action: {
                    self.showSheetView.toggle()
                }) {
                    Image(systemName: "sidebar.leading")
                        .font(Font.system(.title))
                })
                .navigationBarTitle("Prism - \(tagSelected.title)", displayMode: .automatic)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showSheetView, content: {
            Tag.List(selected: $tagSelected)
        })
    }
    
    private func getComponent() -> [Component] {
        return Component.all.filter({$0.tags.contains(where: {$0.id == tagSelected.id})})
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
