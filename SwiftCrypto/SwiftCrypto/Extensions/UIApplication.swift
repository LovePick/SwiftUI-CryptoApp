//
//  UIApplication.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 20/12/2565 BE.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
