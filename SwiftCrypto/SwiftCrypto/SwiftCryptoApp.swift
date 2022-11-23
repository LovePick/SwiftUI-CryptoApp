//
//  SwiftCryptoApp.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 23/11/2565 BE.
//

import SwiftUI

@main
struct SwiftCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
