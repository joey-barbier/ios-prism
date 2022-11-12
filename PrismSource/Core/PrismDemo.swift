//
//  PrismDemo.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 12/11/2022.
//

import SwiftUI

public protocol PrismDemo: View {
    @ViewBuilder var preview: any View { get }
    @ViewBuilder var controls: any View { get }
}
