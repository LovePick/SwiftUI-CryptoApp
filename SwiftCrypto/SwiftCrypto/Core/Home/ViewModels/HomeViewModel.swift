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
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                // subscribe CoinDataService.allCoins
                // when CoinDataService.allCoins data has change
                // will notify to this
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables) // <- subscribe can cancel anytime then need referent pointer
    }
    
}
