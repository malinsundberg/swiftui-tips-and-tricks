//
//  ImageView.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-04.
//

import SwiftUI

struct ImageView: UIViewRepresentable {
    var name: String
    var contentMode: UIView.ContentMode = .scaleAspectFit
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        
        imageView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .vertical)
        imageView.contentMode = contentMode
        
        if let image = UIImage(named: name) {
            imageView.image = image
        }
        
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {}
}
