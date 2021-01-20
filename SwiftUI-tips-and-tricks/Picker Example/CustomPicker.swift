//
//  CustomPicker.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-05.
//

import SwiftUI

struct CustomPicker: View {
    @Environment(\.presentationMode) var presentationMode
    
    let beverageOptions: [HotBeverages]
    @Binding var selection: HotBeverages
    
    var body: some View {
        // A list of all picker options
        List(beverageOptions) { beverageOption in
            Button {
                selection = beverageOption
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text(beverageOption.rawValue.localizedCapitalized)
                    
                    Spacer()
                    
                    if beverageOption == selection {
                        Image(systemName: "checkmark")
                            .foregroundColor(.accentColor)
                    }
                }.foregroundColor(.primary)
            }
        }
        // Apply our styling to the list of picker options
        .navigationTitle("Hot Beverages")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(GroupedListStyle())
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker(beverageOptions: [.espresso, .latte, .cappuccino], selection: .constant(.espresso))
    }
}
