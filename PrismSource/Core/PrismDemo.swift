//
//  PrismDemo.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 12/11/2022.
//

import SwiftUI

public class Prism {}

public class PrismDemoModel: ObservableObject {
    public enum Menu: Int {
        case controls = 0
        case colors = 1
    }
    
    @Published public var menuSelected: Menu = .controls
}

public protocol PrismDemoView: View {
    associatedtype T: PrismDemoModel
    
    var preview:    any View {get}
    var controls:   any View {get}
    var colors:     any View {get}
    var model:      ObservedObject<T> {get set}
}

extension PrismDemoView {
    public var body: some View {
        ScrollView {
            VStack {
                AnyView(preview)
                    .environmentObject(model.wrappedValue)
                    .padding(.top, 64)
                    .padding(.bottom, 52)
                
                Picker("Menu", selection: model.projectedValue.menuSelected) {
                    Text("Controls").tag(PrismDemoModel.Menu.controls)
                    Text("Colors").tag(PrismDemoModel.Menu.colors)
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 52)
                
                if model.wrappedValue.menuSelected == .controls {
                    AnyView(controls)
                        .environmentObject(model.wrappedValue)
                } else {
                    AnyView(colors)
                        .environmentObject(model.wrappedValue)
                }
            }
            .padding(.bottom, 64)
        }
    }
}
