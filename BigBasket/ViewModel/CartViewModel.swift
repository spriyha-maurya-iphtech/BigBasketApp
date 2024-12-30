//
//  CartViewModel.swift
//  Login
//
//  Created by iPHTech34 on 26/11/24.
//
import SwiftUI
  
class CartViewModel: ObservableObject {
        @Published var items: [String: CartItem] = [:] // [Item Name: CartItem]
        @Published var totalCost: Double = 0.0
      // Add item to the cart
        func addItem(name: String, price: Double, imageID: String) {
            if let existingItem = items[name] {
                items[name]?.quantity += 1
            } else {
                items[name] = CartItem(name: name, price: price, imageID: imageID, quantity: 1)
            }
            totalCost += price
        }
     // Remove item from the cart
        func removeItem(name: String, price: Double) {
            if let existingItem = items[name], existingItem.quantity > 1 {
                items[name]?.quantity -= 1
            } else {
                items.removeValue(forKey: name)
            }
            totalCost -= price
        }
    // Get total item count
        func totalItemCount() -> Int {
            items.values.reduce(0) { $0 + $1.quantity }
        }
    }

