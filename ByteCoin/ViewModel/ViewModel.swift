//
//  ViewModel.swift
//  ByteCoin
//
//  Created by Jeferson Dias dos Santos on 19/03/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: AnyObject{
    func updateCoin(coinModel: CoinModel)
}

class ViewModel {
    
    //MARK: - Variables and Constants
    var delegate: ViewModelDelegate?
    let service = Service.shared
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "66E038BC-9D16-48A5-93BA-DA19976A183E"
    
    //MARK: - Methods
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {return}
        service.request(url: url) { coin in
            guard let coin = coin else {return}
            let lastPrice = coin.rate
            let currency = coin.asset_id_quote
            let coinModel = CoinModel(currency: currency, price: lastPrice)
            self.delegate?.updateCoin(coinModel: coinModel)
        }
    }
}
