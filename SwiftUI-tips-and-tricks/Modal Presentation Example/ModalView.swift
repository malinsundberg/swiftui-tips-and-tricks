//
//  ModalView.swift
//  SwiftUI-tips-and-tricks (iOS)
//
//  Created by Malin Sundberg on 2021-01-06.
//

import SwiftUI

struct ModalView<T: View>: UIViewControllerRepresentable {
    let view: T
    let isModal: Bool
    let onDismissalAttempt: (()->())?
    
    // Here we set up our UIKit components
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: view)
    }
    
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {
        uiViewController.parent?.presentationController?.delegate = context.coordinator
        uiViewController.rootView = view
        context.coordinator.modalView = self
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIAdaptivePresentationControllerDelegate {
        var modalView: ModalView
        
        init(_ modalView: ModalView) {
            self.modalView = modalView
        }
        
        func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
            // This simulates the UIKit isModalInPresentation behaviour
            // (https://developer.apple.com/documentation/uikit/uiviewcontroller/3229894-ismodalinpresentation)
            // If isModal is true, it indicates that the view should not be dismissed
            !modalView.isModal
        }
        
        func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
            modalView.onDismissalAttempt?()
        }
    }
}

extension View {
    func presentation(isModal: Bool, onDismissalAttempt: (()->())? = nil) -> some View {
        // Here we create a wrapper ModalView which displays the view, and determines whether or not the view can be interactively dismissed based on isModal
        ModalView(view: self, isModal: isModal, onDismissalAttempt: onDismissalAttempt)
    }
}
