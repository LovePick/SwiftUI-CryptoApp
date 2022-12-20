//
//  HomeStatsView.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 20/12/2565 BE.
//

import SwiftUI

struct HomeStatsView: View {
    // MARK: - PROPERTY
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    // MARK: - BODY
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
                
            }//: FOREACH
        }//: HSTACK
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading
        )
    }
}

// MARK: - PREVIEW
struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
