//
//  BitcoinModel.swift
//  ByteCoin
//
//  Created by Jeferson Dias dos Santos on 30/12/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    var time: String
    var asset_id_base: String
    var asset_id_quote: String
    var rate: Double
}
