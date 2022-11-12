//
//  Tag.swift
//  Prism
//
//  Created by Joey BARBIER on 11/05/2021.
//

import SwiftUI

public protocol Tag: Identifiable {
    var id: String { get }
    var title: String { get }
    var image: Image { get }
}
