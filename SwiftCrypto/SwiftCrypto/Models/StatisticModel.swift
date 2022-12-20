//
//  StatisticModel.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 20/12/2565 BE.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
}

