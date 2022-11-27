//
//  PrismDemo.swift
//  OrkaPrism
//
//  Created by Joey BARBIER on 12/11/2022.
//

import SwiftUI

public class Prism {
    static var resourceBundle: Bundle? = {
        let frameworkBundle = Bundle(for: Prism.self)
        guard let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("Prism.bundle") else {
            return nil
        }
        return Bundle(url: bundleURL)
    }()
    
    public class Button{}
}
