//
//  HomeViewModel.swift
//  SwiftCoin
//
//  Created by Krishnatrea on 29/09/23.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var coins = [CoinModel]()
    @Published var topMovingCoin = [CoinModel]()
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error  in
            
            if let error = error {
                print("DEBUE: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response code \(response.statusCode)")
            }
           
            guard let data = data else {
                return
            }
            
            do {
                let coins = try JSONDecoder().decode([CoinModel].self, from: data)
                
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoin()
                }
            } catch let err {
                print("DEBUG: Fail to decode with error \(err)")
            }
        }.resume()
    }
    
    
    func configureTopMovingCoin() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoin = Array(topMovers.prefix(5))
    }
    
}
