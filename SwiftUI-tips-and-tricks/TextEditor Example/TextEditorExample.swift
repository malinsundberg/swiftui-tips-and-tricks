//
//  TextEditorExample.swift
//  SwiftUI-tips-and-tricks
//
//  Created by Malin Sundberg on 2021-01-10.
//

import SwiftUI

struct TextEditorExample: View {
    @State private var notes = ""
    
    var body: some View {
        Form {
            // Using the TextEditor
            Section {
                TextEditor(text: $notes)
                    .frame(height: 85)
            }
            
            // Using a custom view with a placeholder text
            Section {
                TextEditorWithPlaceholderText(placeholderText: "Notes", enteredText: $notes)
                    .frame(height: 85)
            }
        }.navigationTitle("TextEditor Example")
    }
}

struct TextEditorExample_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorExample()
    }
}
