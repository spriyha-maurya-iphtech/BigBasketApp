//
//  TopTitleView.swift
//  BigBasket
//
//  Created by iPHTech34 on 15/11/24.
//

import SwiftUI

struct TopTitleView: View {
    @Binding var showSideMenu: Bool
    @EnvironmentObject var cartViewModel: CartViewModel
    var body: some View {
        HStack {
            // Menu Button (Hamburger Icon)
            Button(action: {
                // Menu button action
                withAnimation {
                    showSideMenu.toggle()
                 }
            }) {
                Image(systemName: "line.horizontal.3")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            HStack(spacing: 8) {
                       Image("bblogo") // Replace "Logo" with your logo asset name
                           .resizable()
                           .scaledToFit()
                           .frame(width: 24, height: 24) // Adjust size as needed
                       
                       // "bigbasket" with "big" in red and "basket" in black
                       Text("big")
                           .font(.headline)
                           .foregroundColor(.red)
                       + Text("basket")
                           .font(.headline)
                           .foregroundColor(.black)
                   }
                   
            Spacer()
            
            NavigationLink(destination: CartDetailView()) {
                           HStack {
                               Image(systemName: "cart")
                                   .font(.system(size: 24))
                                   .foregroundColor(.black)

                               if cartViewModel.totalItemCount() > 0 {
                                   Text("\(cartViewModel.totalItemCount())")
                                       .font(.caption)
                                       .foregroundColor(.white)
                                       .padding(6)
                                      .background(Color.red)
                                    .clipShape(Circle())
                               }
                           }
                       }
                   }
        .padding()
        .background(Color.green)
        .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)
    }
}

