//
//  ModalPresentationExample.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-06.
//

import SwiftUI

struct ModalPresentationExample: View {
    // Just like in the Multiple Sheets Example, we'll use an enum here to define the different sheets that can be presented from the view
    private enum ModalPresentationSheetType: String, Identifiable {
        var id: String {
            self.rawValue
        }
        
        case defaultBehaviourSheet, customBehaviourSheet
    }
    
    
    @State private var sheetType: ModalPresentationSheetType? = nil
    
    // This is used for our custom implementation
    @State private var isSheetModal = false
    
    var body: some View {
        let sheetPresentedBinding = Binding<Bool>(get: {
            sheetType != nil
        }, set: {
            if !$0 {
                sheetType = nil
            }
        })
        
        VStack {
            // Default sheet behaviour
            Button("Default Behaviour") {
                sheetType = .defaultBehaviourSheet
            }.padding()
            
            // Custom implementation that prevents accidental interactive sheet dismissal
            Button("Custom Behaviour") {
                sheetType = .customBehaviourSheet
            }.padding()
        }.sheet(item: $sheetType) { sheetType in
            switch sheetType {
            case .defaultBehaviourSheet:
                // By default we present a simple view inside of a navigationView
                NavigationView {
                    DefaultBehaviourSheet()
                }
            case .customBehaviourSheet:
                // Here we create a custom view by passing it isSheetModal as a binding variable
                // and sheetPresentedBinding, which we will used to dismiss CustomBehaviourSheet
                NavigationView {
                    CustomBehaviourSheet(isModal: $isSheetModal, isPresented: sheetPresentedBinding)
                }
                // This is needed to prevent the interactive dismissal of the sheet
                // and ad our isModalInPresentation behaviour (https://developer.apple.com/documentation/uikit/uiviewcontroller/3229894-ismodalinpresentation)
                .presentation(isModal: isSheetModal)
                .onDisappear {
                    // We're reseting our modal state on dismissal of the sheet
                    isSheetModal = false
                }
            }
        }.navigationTitle("Modal Example")
    }
}

struct ModalPresentationExample_Previews: PreviewProvider {
    static var previews: some View {
        ModalPresentationExample()
    }
}
