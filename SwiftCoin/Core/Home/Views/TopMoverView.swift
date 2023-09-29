//
//  TopMoverView.swift
//  SwiftCoin
//
//  Created by Krishnatrea on 29/09/23.
//

import SwiftUI

struct TopMoverView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topMovingCoin) {coin in
                        TopMoverItemView(coin: coin)
                    }
                }
            }
            
        }
        .padding()
    }
}

struct TopMoverView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoverView(viewModel: HomeViewModel())
    }
}
