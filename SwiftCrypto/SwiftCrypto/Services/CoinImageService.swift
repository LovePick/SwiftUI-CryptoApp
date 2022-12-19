//
//  CoinImageService.swift
//  SwiftCrypto
//
//  Created by Supapon Pucknavin on 15/12/2565 BE.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImaage()
    }
    
    private func getCoinImaage() {
        
        if let saveImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = saveImage
            print("Retrieved image from File Manager!")
        } else {
            downloadCoinImage()
            print("Download image now")
        }
        
    }
    
    private func downloadCoinImage() {
        guard let urlString = self.coin.image else { return }
        guard let url = URL(string: urlString) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] (returnedImage) in
                guard
                    let self = self,
                    let downloadImage = returnedImage
                    else { return }
                
                self.image = downloadImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
