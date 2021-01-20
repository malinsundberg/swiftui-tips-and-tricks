//
//  ImageExample.swift
//  SwiftUI-tips-and-tricks
//
//  Created by Malin Sundberg on 2021-01-05.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        VStack {
            Text("SwiftUI Image")
                .font(.title3)
                .bold()
            Image("ExampleImage")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 500)
                .padding()
            
            Divider()
            
            Text("Custom UIViewRepresentable")
                .font(.title3)
                .bold()
            
            ImageView(name: "ExampleImage", contentMode: .scaleAspectFit)
                .frame(maxHeight: 500)
                .padding()
        }.navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
}

struct imageExample_Previews: PreviewProvider {
    static var previews: some View {
        ImageExample()
    }
}
