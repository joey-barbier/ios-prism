//
//  PrismDemoModel.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 15/11/2022.
//

import SwiftUI

public class PrismDemoModel: ObservableObject {
    public enum Menu: Int {
        case params = 0
        case colors = 1
        case status = 2
        case documentation = 3
    }
    
    @Published public var menuSelected: Menu = .status
}
