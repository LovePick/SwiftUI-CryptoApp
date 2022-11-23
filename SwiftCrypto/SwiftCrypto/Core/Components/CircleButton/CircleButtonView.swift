//
//  CircleButtonView.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 23/11/2565 BE.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    
    // MARK: - BODY
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
    }
}

// MARK: - PREVIEW
struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            CircleButtonView(iconName: "info")
                .previewLayout(.sizeThatFits)
            
            CircleButtonView(iconName: "plus")
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
        }//: GROUP
        
    }
}
