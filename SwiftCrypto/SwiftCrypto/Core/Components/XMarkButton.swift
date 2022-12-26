//
//  XMarkButton.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 26/12/2565 BE.
//

import SwiftUI

struct XMarkButton: View {
    // MARK: - PROPERTY
    @Binding var presentationMode:PresentationMode
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            presentationMode.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })//: BUTTON
    }
}

// MARK: - PREVIEW
//struct XMarkButton_Previews: PreviewProvider {
//    static var previews: some View {
//        XMarkButton()
//    }
//}
