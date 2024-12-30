//
//  CategoriesSectionView.swift
//  BigBasket
//
//  Created by iPHTech34 on 15/11/24.
//


import SwiftUI

struct CategoriesSectionView: View{
    let categories = [
        ("Fruits", "Fruit"), // Replace with actual product images
        ("Vegetables", "Vegetables"),
        ("Dairy", "Dairy"),
        ("Bakery", "Bakery"),
        ("Beverages", "Beverage"),
        ("Snacks", "Snacks"),
        ("Frozen", "Frozen"),
        ("Meat", "Fish"),
        ("Household", "HouseHold"),
        ("Spices", "Spices"),
        ("Drinks", "Drinks"),
        ("Organic", "Organic")
    ]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3) // Define 3 columns with flexible width
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("SHOP BY CATEGORIES")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.top)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(categories, id: \.0) { category in
                            NavigationLink(destination: destinationView(for: category.0)) {
                                VStack {
                                    ZStack {
                                        Circle()
                                            .fill(Color.white) // Background for circle
                                            .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2) // Shadow effect
                                        
                                        Image(category.1) // Replace with actual image names
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50) // Adjust size as needed
                                            .foregroundColor(.green) // Adjust color if using SF Symbols
                                    }
                                    .frame(width: 80, height: 80) // Circle size
                           
                                    Text(category.0)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .frame(height: 300) // Set the height of the scrollable area to 300
            }
            //.padding(.horizontal)
          
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private func destinationView(for category: String) -> some View {
        if category == "Fruits" {
            FruitView() // Navigate to FruitView for "Fruits" category
        } else {
            Text("\(category) View is not implemented yet")
                .font(.headline)
                .foregroundColor(.gray)
                .navigationTitle(category)
        }
    }
}


struct CategoriesSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesSectionView()
    }
}
