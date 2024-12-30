//
//  CartDetailView.swift
//  Login
//
//  Created by iPHTech34 on 26/11/24.
//

import SwiftUI

struct CartDetailView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var body: some View {
        VStack {
            if cartViewModel.items.isEmpty {
                Text("Your cart is empty!")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(cartViewModel.items.keys.sorted(), id: \.self) { item in
                        if let cartItem = cartViewModel.items[item] {
                            CartItemRow(itemName: item, cartItem: cartItem)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
     Text("Total Cost: Rs \(cartViewModel.totalCost, specifier: "%.2f")")
                .font(.headline)
                .padding()
        }
        .navigationTitle("Cart Details")
    }
}

struct CartItemRow: View {
    let itemName: String
    let cartItem: CartItem // Assuming `CartItem` is a model in `CartViewModel`
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        HStack {
            // Display item image
            Image(cartItem.imageID) // Use the item name or a unique image identifier
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)

            VStack(alignment: .leading) {
                Text(itemName)
                    .font(.headline)

                Text("Quantity: \(cartItem.quantity)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("Price: Rs \(cartItem.price, specifier: "%.2f")")
                    .font(.subheadline)
            }

            Spacer()

            // Remove button
            Button(action: {
                cartViewModel.removeItem(name: itemName, price: cartItem.price)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 8)
    }
}



