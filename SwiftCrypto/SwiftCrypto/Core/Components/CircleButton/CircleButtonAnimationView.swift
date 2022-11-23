//
//  CircleButtonAnimationView.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 23/11/2565 BE.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    // MARK: - PROPERTY
    @Binding var animate: Bool
    
    // MARK: - BODY
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : nil, value: animate)
            
        
    }
}


// MARK: - PREVIEW
struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
