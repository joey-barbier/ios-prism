//
//  PrismButtonLoader_Demo.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 12/11/2022.
//

import SwiftUI

public enum Menu: Int {
    case controls = 0
    case colors = 1
}

public protocol DemoView: View {
    var preview:    any View {get}
    var controls:   any View {get}
    var colors:     any View {get}
}

// MARK: - DEMO
extension Prism.Button.Loader {
    public struct Demo: View {
        @State public var favoriteColor: Int = 0
        @StateObject var model = Model()
        
        public init() {}
        
        public var body: some View {
            ScrollView {
                VStack {
                    Preview()
                        .environmentObject(model)
                    
                    Spacer()
                    
                    Picker("What is your favorite color?", selection: $favoriteColor) {
                        Text("Controls").tag(0)
                        Text("Colors").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(.bottom, 48)
                    
                    switch favoriteColor {
                    case 0:
                        Controls()
                            .environmentObject(model)
                    case 1:
                        Colors()
                            .environmentObject(model)
                    default:
                        EmptyView()
                    }
                }
            }
        }
        
        class Model: ObservableObject {
            @Published public var isLoading: Bool = false
            @Published public var width: String = "250"
            @Published public var height: String = "55"
            @Published public var cornerRadius: String = "8"
            @Published public var textColor: Color = .white
            @Published public var backgroundColor: Color = Color(#colorLiteral(red: 0.5266463229, green: 0.3556309824, blue: 1, alpha: 1))
            @Published public var loadingColor: Color = Color(#colorLiteral(red: 0.2185284262, green: 0.147566736, blue: 0.4149434198, alpha: 1))
            @Published public var strokeWidth: String = "5"
            @Published public var strokeColor: Color = .white
            @Published public var title: String = "Télécharger"
        }
    }
}

extension Prism.Button.Loader.Demo {
    struct Preview: View {
        @EnvironmentObject var model: Model
        
        var body: some View {
            VStack {
                Prism.Button.Loader(action: {},
                                    isLoading: $model.isLoading,
                                    style: Prism.Button.Loader.Style(width: NumberFormatter().number(from: model.width) as? CGFloat,
                                                                     height: NumberFormatter().number(from: model.height) as? CGFloat,
                                                                     cornerRadius: NumberFormatter().number(from: model.cornerRadius) as? CGFloat,
                                                                     backgroundColor: model.backgroundColor,
                                                                     loadingColor: model.loadingColor,
                                                                     strokeWidth: NumberFormatter().number(from: model.strokeWidth) as? CGFloat,
                                                                     strokeColor: model.strokeColor),
                                    builder: {
                    Text(model.title)
                        .foregroundColor(model.textColor)
                })
                Button {
                    model.isLoading = false
                } label: {
                    Text("Arrêter le chargement")
                }
            }
        }
    }
}

extension Prism.Button.Loader.Demo {
    struct Controls: View {
        @EnvironmentObject var model: Model
        
        var body: some View {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Titre du bouton :")
                    TextField("", text: $model.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Largeur :")
                    TextField(model.width, text: $model.width)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Hauteur :")
                    TextField(model.height, text: $model.height)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Corner radius :")
                    TextField("", text: $model.cornerRadius)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Taille du trait :")
                    TextField("", text: $model.strokeWidth)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }
            }
        }
    }
}

extension Prism.Button.Loader.Demo {
    struct Colors: View {
        @EnvironmentObject var model: Model
        
        var body: some View {
            if #available(iOS 14.0, *) {
                ColorPicker("Couleur de fond", selection: $model.backgroundColor)
                ColorPicker("Couleur de chargement", selection: $model.loadingColor)
                ColorPicker("Couleur du trait", selection: $model.strokeColor)
            } else {
                EmptyView()
            }
        }
    }
}
