//
//  PickerExample.swift
//  SwiftUI-tips-and-tricks
//
//  Created by Malin Sundberg on 2021-01-05.
//

import SwiftUI

struct PickerExample: View {
    @State private var beverageSelection: HotBeverages = .latte
    
    var body: some View {
        Form {
            // The default picker which will display the picker options in a separate view
            Section(header: Text("Default Picker")) {
                Picker("Selected beverage", selection: $beverageSelection) {
                    ForEach(HotBeverages.allCases, id: \.self) { option in
                        Text(option.rawValue.localizedCapitalized)
                    }
                }
            }
            
            // Our custom implementation that displays the pickable options in a custom view
            Section(header: Text("Custom Picker")) {
                NavigationLink(
                    destination: CustomPicker(beverageOptions: HotBeverages.allCases, selection: $beverageSelection),
                    label: {
                        HStack {
                            Text("Selected beverage")
                            Spacer()
                            Text(beverageSelection.rawValue.localizedCapitalized)
                                .foregroundColor(.secondary)
                        }
                    })
            }
        }.navigationTitle("Picker Example")
    }
}

struct PickerExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerExample()
    }
}
