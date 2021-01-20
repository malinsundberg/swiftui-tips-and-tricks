//
//  SheetExample.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-05.
//

import SwiftUI

struct SheetExample: View {
    // This enum defines the different sheets that can be displayed from this view
    private enum SheetType: String, Identifiable {
        var id: String {
            rawValue
        }
        
        case sheetOne, sheetTwo
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
            // If sheetType is not nil, we will display a sheet
            // We'll use a switch case to determine which sheet we should display
            switch sheetType {
            case .sheetOne:
                SheetOne()
            case .sheetTwo:
                SheetTwo()
            }
        }.navigationTitle("Sheets Example")
    }
}

struct SheetExamples_Previews: PreviewProvider {
    static var previews: some View {
        SheetExample()
    }
}
