//
//  TopMoverItemView.swift
//  SwiftCoin
//
//  Created by Krishnatrea on 29/09/23.
//

import SwiftUI
import Kingfisher
struct TopMoverItemView: View {
    let coin : CoinModel
    var body: some View {
        VStack(alignment: .leading) {
            // image
            KFImage(URL(string: "\(coin.image)"))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            
            // coin info
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // persentage
            
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color("itembackgroundColor"))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        }
    }
}
