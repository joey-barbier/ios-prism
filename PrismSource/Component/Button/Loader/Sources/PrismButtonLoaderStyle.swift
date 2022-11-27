//
//  SwiftUIView.swift
//  
//
//  Created by 변경민 on 2020/12/02.
//

import SwiftUI

/// A Fully Configuarable Button Style

extension Prism.Button.Loader {
    public struct Style {
        public init(width: CGFloat? = nil,
                    height: CGFloat? = nil,
                    cornerRadius: CGFloat? = nil,
                    backgroundColor: Color? = nil,
                    loadingColor: Color? = nil,
                    strokeWidth: CGFloat? = nil,
                    strokeColor: Color? = nil) {
            self.width = width ?? 250
            self.height = height ?? 55
            self.cornerRadius = cornerRadius ?? 8
            self.backgroundColor = backgroundColor ?? Color.primary
            self.loadingBackgroundColor = loadingColor ?? Color.secondary
            self.strokeWidth = strokeWidth ?? 5
            self.strokeColor = strokeColor ?? Color.gray.opacity(0.6)
        }
        
        /// Width of button
        public var width: CGFloat
        /// Height of button
        public var height: CGFloat
        /// Corner radius of button
        public var cornerRadius: CGFloat
        /// Background color of button
        public var backgroundColor: Color
        /// Background color of button when loading. 50% opacity of background color gonna be set if blank.
        public var loadingBackgroundColor: Color
        /// Width of circle loading bar stroke
        public var strokeWidth: CGFloat
        /// Color of circle loading bar stroke
        public var strokeColor: Color
    }
}
