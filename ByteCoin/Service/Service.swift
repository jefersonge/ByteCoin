//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Service {
    
    static let shared = Service()
    
    func request(url: URL, completion: @escaping(CoinData?)-> Void){
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            do {
                let coin = try JSONDecoder().decode(CoinData.self, from: data)
                DispatchQueue.main.async {
                    completion(coin)
                }
            } catch  {
                print(error)
                completion(nil)
            }
        }
        task.resume()
    }
}


