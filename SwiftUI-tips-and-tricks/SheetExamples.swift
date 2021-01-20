//
//  SheetExamples.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-05.
//

import SwiftUI

struct SheetExample: View {
    private enum SheetType: String, Identifiable {
        var id: String {
            self.rawValue
        }
        
        case sheetOne, sheetTwo
        
        var sheet: some View {
            NavigationView {
                switch self {
                case .sheetOne:
                    SheetOne()
                case .sheetTwo:
                    SheetTwo()
                }
            }
        }
    }
    
    @State private var sheetType: SheetType? = nil
    
    var body: some View {
        VStack {
            Button("Present Sheet 1️⃣") {
                sheetType = .sheetOne
            }.padding()
            
            Button("Present Sheet 2️⃣") {
                sheetType = .sheetTwo
            }.padding()
        }.sheet(item: $sheetType) { sheetType in
            sheetType.sheet
        }.navigationTitle("Multiple Sheets Example")
    }
}

struct SheetExamples_Previews: PreviewProvider {
    static var previews: some View {
        SheetExample()
    }
}
