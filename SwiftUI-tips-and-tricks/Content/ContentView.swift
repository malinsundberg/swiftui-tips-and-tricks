//
//  ContentView.swift
//  Shared
//
//  Created by Malin Sundberg on 2021-01-04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(
                    destination: ImageExample(),
                    label: {
                        Text("Image Example")
                    })
                
                NavigationLink(
                    destination: TextEditorExample(),
                    label: {
                        Text("TextEditor Example")
                    })
                
                NavigationLink(
                    destination: PickerExample(),
                    label: {
                        Text("Picker Example")
                    })
                
                NavigationLink(
                    destination: SheetExample(),
                    label: {
                        Text("Multiple Sheets Example")
                    })
                
                NavigationLink(
                    destination: ModalPresentationExample(),
                    label: {
                        Text("Modal Presentation Example")
                    })
            }.navigationTitle("Tips & Tricks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
