//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 1/12/2565 BE.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        /// Remove this coz we combine subscribe dataService.$allCoins in new function
        /*
         dataService.$allCoins
         .sink { [weak self] (returnedCoins) in
         // subscribe CoinDataService.allCoins
         // when CoinDataService.allCoins data has change
         // will notify to this
         self?.allCoins = returnedCoins
         }
         .store(in: &cancellables) // <- subscribe can cancel anytime then need referent pointer
         
         */
        
        // update allCoins
        $searchText
            .combineLatest(dataService.$allCoins) // <- subscribe $searchText and dataService.$allCoins
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins) // <- output will be (text: String, coins: [CoinModel]) string from $searchText and [CoinModel] from dataService.allCoins ( can use sink but we need to convert to filter responst [CoinModel]
            .sink { [weak self](returnedCoins) in // <- after filter return [CoinModel]
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables) // <- subscribe can cancel anytime then need referent pointer
    }
    
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        let filteredCoins = coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
        
        return filteredCoins
    }
}
