//
//  CoinLogoView.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 26/12/2565 BE.
//

import SwiftUI

struct CoinLogoView: View {
    // MARK: - PROPERTY
    let coin: CoinModel
    
    // MARK: - BODY
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Text(coin.name)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
            
            
        }//: VSTACK
    }
}

// MARK: - PREVIEW
struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CoinLogoView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
