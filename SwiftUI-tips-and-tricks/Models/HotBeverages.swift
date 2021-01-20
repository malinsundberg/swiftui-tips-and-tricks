//
//  ColorOptions.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-05.
//

import Foundation

// An enum for our picker example with different beverage options
enum HotBeverages: String, Identifiable, CaseIterable {
    var id: String {
        rawValue
    }
    
    case espresso, americano, macchiato, gibraltar, cappuccino, latte, tea
}
