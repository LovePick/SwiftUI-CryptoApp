//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 1/12/2565 BE.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var statistics: [StatisticModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
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
            .combineLatest(coinDataService.$allCoins) // <- subscribe $searchText and dataService.$allCoins
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins) // <- output will be (text: String, coins: [CoinModel]) string from $searchText and [CoinModel] from dataService.allCoins ( can use sink but we need to convert to filter responst [CoinModel]
            .sink { [weak self](returnedCoins) in // <- after filter return [CoinModel]
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables) // <- subscribe can cancel anytime then need referent pointer
        
        
        // update marketData
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
        
        
        // update portfolioCoins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map { (coinModels, portfolioEntities) -> [CoinModel] in
                coinModels
                    .compactMap { (coin) -> CoinModel? in
                        guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else { return nil }
                        
                        return coin.updateHoldings(amount: entity.amount)
                    }
            }
            .sink { [weak self](returnCoins) in
                
                self?.portfolioCoins = returnCoins
            }
            .store(in: &cancellables)
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
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
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) ->  [StatisticModel]{
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let  portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        
        return stats
    }
}
