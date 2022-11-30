//
//  CoinRowView.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 30/11/2565 BE.
//

import SwiftUI

struct CoinRowView: View {
    // MARK: - PROPERTY
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 0) {
            
            leftColumn
            
            Spacer()
            
            if showHoldingsColumn {
                centerColumn
            }//: CONDITION
            
            rightColumn
            
        }//: HSTACK
        .font(.subheadline)
        
    }
}


// MARK: - COMPONENT
extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30, height: 30)
            
            Text((coin.symbol ?? "").uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }//: HSTACK
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            
            Text((coin.currentHoldings ?? 0).asNumberString())
            
        }//: VSTACK
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing ) {
            Text((coin.currentPrice ?? 0.0).asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChange24H ?? 0 ) >= 0 ?
                    Color.theme.green : Color.theme.red
                )
            
            
        }//: VSTACK
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}

// MARK: - PREVIEW
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
    }
}
