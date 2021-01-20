//
//  DefaultBehaviourSheet.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-06.
//

import SwiftUI

struct DefaultBehaviourSheet: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var favouriteCoffee: String = ""
    
    var body: some View {
        Form {
            TextField("Favourite Coffee", text: $favouriteCoffee)
        }.toolbar() {
            ToolbarItem(placement: ToolbarItemPlacement.cancellationAction) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                })
            }
            
            ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {
                Button(action: {
                    // Here we would normally add logic to save the user input and then dismiss the view
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                })
                // We only want to allow save if there's something to save
                .disabled(favouriteCoffee.isEmpty)
            }
        }.navigationTitle("Default Presentation")
    }
}

struct DefaultBehaviourSheet_Previews: PreviewProvider {
    static var previews: some View {
        DefaultBehaviourSheet()
    }
}
