//
//  SheetOne.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-05.
//

import SwiftUI

struct SheetOne: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sheet 1️⃣")
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

struct SheetOne_Previews: PreviewProvider {
    static var previews: some View {
        SheetOne()
    }
}
