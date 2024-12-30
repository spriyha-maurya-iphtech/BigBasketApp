//
//  FruitView.swift
//  BigBasket
//
//  Created by iPHTech34 on 18/11/24.
//
import SwiftUI

struct FruitView: View {
    let fruits = [
        ("Orange", "1.49", "2.00", "fr1"),
        ("Strawberry", "0.50", "0.70", "fr9"),
        ("WaterMelon", "1.49", "2.00", "fr3"),
        ("Pomegranate", "5.99", "8.00", "fr4"),
        ("Dragon Fruit", "3.49", "4.50", "fr5"),
        ("Salmon Filet", "6.49", "8.00", "fr6"),
        ("Mango", "2.49", "3.00", "fr7"),
        ("Kiwi", "1.29", "1.50", "fr8")
    ]
    @State private var cart: [String: Int] = [:]
    @EnvironmentObject var cartViewModel: CartViewModel
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2) // Adjust spacing if needed
    
    var body: some View {
        ScrollView {
           VStack(alignment: .leading) {
            //    LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(fruits, id: \.0) { fruit in
                        HStack(spacing: 15) {
                            // Fruit image
                            Image(fruit.3)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80) // Adjusted size
                                .cornerRadius(10)
                            
                            // Fruit details and cart controls
                            VStack(alignment: .leading, spacing: 10) {
                                Text(fruit.0)
                                    .font(.headline)
                                    .lineLimit(1)
                                
                                HStack {
                                    Text("Rs \(fruit.1) each")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                    
                                    Text("Rs \(fruit.2) per kg")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }
                                
                                // Add-to-cart controls
                                HStack(spacing: 10) {
                                    Button(action: {
                                        // Safely parse the price
                                        if let price = Double(fruit.1) {
                                            cartViewModel.removeItem(name: fruit.0, price: price)
                                        }
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.red)
                                            .font(.title2)
                                    }
                                    
                                    Text("\(cartViewModel.items[fruit.0]?.quantity ?? 0)")
                                        .font(.headline)
                                        .frame(width: 30, alignment: .center)
                                    
                                    Button(action: {
                                        // Safely parse the price
                                        if let price = Double(fruit.1) {
                                            cartViewModel.addItem(name: fruit.0, price: price, imageID: fruit.3)
                                        }
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.green)
                                            .font(.title2)
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
             //   }
                .padding(.horizontal)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Fruits")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {}
    }
    
    // MARK: - Helper Functions
    
    func calculateTotal() -> Double {
        var total: Double = 0.0
        for fruit in fruits {
            let fruitName = fruit.0
            if let price = Double(fruit.1) {
                let quantity = cart[fruitName] ?? 0
                total += Double(quantity) * price
            }
        }
        return total
    }
}

struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        FruitView()
    }
}
