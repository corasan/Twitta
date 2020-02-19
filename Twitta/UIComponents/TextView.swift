//
//  TextView.swift
//  Twitta
//
//  Created by Henry Paulino on 2/19/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    typealias UIViewType = UITextView
    
    @Binding var text: String
    var placeholderText: String
    
    func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
        let textView = UITextView()

        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.textColor = .gray
        textView.text = placeholderText
        textView.backgroundColor = UIColor(red:0.08, green:0.13, blue:0.17, alpha:1.0)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>) {
        if (text != "" || uiView.textColor == .white) {
            uiView.text = text
            uiView.textColor = .gray
        }
        
        uiView.delegate = context.coordinator
    }
    
    func frame(numLines: CGFloat) -> some View {
        let height = UIFont.systemFont(ofSize: 17).lineHeight * numLines
        return self.frame(height: height)
    }
    
    func makeCoordinator() -> TextView.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextView
        
        init(_ parent: TextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if (textView.textColor == .gray) {
                textView.text = ""
                textView.textColor = .white
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if (textView.text == "") {
                textView.text = parent.placeholderText
                textView.textColor = .gray
            }
        }
    }
}
