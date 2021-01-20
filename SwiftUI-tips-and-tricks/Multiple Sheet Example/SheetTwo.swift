//
//  SheetTwo.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-05.
//

import SwiftUI

struct SheetTwo: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sheet 2️⃣")
                    .font(.title)
                    .bold()
                Spacer()
            }.toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct SheetTwo_Previews: PreviewProvider {
    static var previews: some View {
        SheetTwo()
    }
}
