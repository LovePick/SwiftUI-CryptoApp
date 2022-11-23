//
//  ContentView.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 23/11/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PREPERTY
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
                
            }//: VSTACK
            .font(.headline)
            
        }//: ZSTACK
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


