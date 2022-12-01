//
//  CoinDataService.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 1/12/2565 BE.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [CoinModel] = []

    var coinSubscription: AnyCancellable?
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        
        /// ******************
        /// 1. PROTOTYPE
        /// ******************
        /*
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url) // <- subscribe can cancel anytime then need referent pointer
            .subscribe(on: DispatchQueue.global(qos: .default)) // <- it's default but for sure
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                        response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main) // <- return output.data in main thread
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished: // <- decode success, do nothing jump to receiveValue closure
                    break
                case.failure(let error): // <- decode error
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
                self?.coinSubscription?.cancel()
            }
            
        */
        
        
        /// ******************
        /// 2. After Move URLSession Combine code to NetworkingManager.download
        /// ******************
        /*
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished: // <- decode success, do nothing jump to receiveValue closure
                    break
                case.failure(let error): // <- decode error
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
                self?.coinSubscription?.cancel()
            }
        */
        
        
        /// ******************
        /// 3. After Move sink code to NetworkingManager.handleCompletion
        /// ******************
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
                self?.coinSubscription?.cancel()
            })
           
    }
}
