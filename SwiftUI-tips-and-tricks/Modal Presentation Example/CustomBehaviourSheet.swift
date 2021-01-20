//
//  CustomBehaviourSheet.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-06.
//

import SwiftUI

struct CustomBehaviourSheet: View {
    @State private var favouriteCoffee = ""
    
    @Binding var isModal: Bool
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Form {
                TextField("Favourite Coffee", text: $favouriteCoffee)
            }
        }.toolbar {
            
            ToolbarItem(placement: ToolbarItemPlacement.cancellationAction) {
                Button("Cancel") {
                    isPresented = false
                }
            }
            ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {
                Button(action: {
                    // Here we would normally add logic to save the user input and then dismiss the view
                    isPresented = false
                }, label: {
                    Text("Save")
                }).disabled(favouriteCoffee.isEmpty)
            }
        }.navigationTitle("Custom Presentation")
        .onChange(of: calculateModalState()) { shouldBeModal in
            // We set our binding isModal variable here to enforce the behaviour that we want for
            // the interactive dismissal from the presenting view (in the ModalPresentationExample view)
            // If isModal is true, it means that we don't allow for interactive dismissal
            isModal = shouldBeModal
        }
    }
     
    private func calculateModalState() -> Bool {
        // If there's text entered to the TextField, we don't allow for interactive dismissal
        // If we would have multiple text fields in this view, we would check if any of them have text in them to determine this state
        !favouriteCoffee.isEmpty
    }
}

struct CustomBehaviourSheet_Previews: PreviewProvider {
    static var previews: some View {
        CustomBehaviourSheet(isModal: .constant(true), isPresented: .constant(true))
    }
}
