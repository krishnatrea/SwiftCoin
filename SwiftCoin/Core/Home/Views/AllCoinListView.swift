//
//  AllCoinListView.swift
//  SwiftCoin
//
//  Created by Krishnatrea on 29/09/23.
//

import SwiftUI

struct AllCoinListView: View {
    
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Coin")
                Spacer()
                Text("Price")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ForEach(viewModel.coins) { coin  in
                AllCoinItemView(coin: coin)
            }
        }
    }
}
