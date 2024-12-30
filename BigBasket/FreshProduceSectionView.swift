//
//   FreshProduceSectionView.swift
//  BigBasket
//
//  Created by iPHTech34 on 15/11/24.
//

import SwiftUI

struct FreshProduceSectionView: View {
    let freshProducts = [
        ("Apple - Fuji", "Applef", "1 kg", "Rs 86"),
        ("Apple - Red", "AppleR", "1 kg", "Rs 90"),
        ("Apple - Green", "Appleg", "1 kg", "Rs 100"),
        ("Banana", "Banana", "1 Dozen", "Rs 50"),
        ("Orange", "Orange", "1 kg", "Rs 60")
    ]
var body: some View {
        VStack(alignment: .leading) {
            Text("FRESH PRODUCT")
                .font(.headline)
                .foregroundColor(.gray)
            ScrollView(.horizontal, showsIndicators: false) { // Horizontal ScrollView
                HStack(spacing: 30) { // Spacing between the items
                    ForEach(freshProducts, id: \.0) { product in
                        VStack {
                            Image(product.1) // Replace with product image names
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 100)
                                .cornerRadius(8)
                                .clipped()
                            
                            Text(product.0) // Product Name
                                .font(.caption)
                                .foregroundColor(.black)
                            
                            Text(product.2) // Weight/Quantity
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text(product.3) // Price
                                .font(.caption)
                                .foregroundColor(.green)
                        }
                    }
                }
               // .padding(.horizontal)
                .frame(height: 160)
            }
        }
    }
}

struct FreshProduceSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FreshProduceSectionView()
    }
}

