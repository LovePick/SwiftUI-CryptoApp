//
//  StatisticView.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 20/12/2565 BE.
//

import SwiftUI

struct StatisticView: View {
    // MARK: - PROPERTY
    let stat: StatisticModel
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack( spacing: 4 ) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(
                            degrees:
                                (stat.percentageChange ?? 0) >= 0 ? 0 : 180
                        )
                    )
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }//: HSTACK
            .foregroundColor(
                (stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red
            )
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
            
        }//: VSTACK
    }
}

// MARK: - PREVIEW
struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: dev.state1)
                .padding()
                .previewLayout(.sizeThatFits)
            
            StatisticView(stat: dev.state2)
                .padding()
                .previewLayout(.sizeThatFits)
            
            StatisticView(stat: dev.state3)
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }
}
