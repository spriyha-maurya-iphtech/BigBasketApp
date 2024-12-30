//
//  TabBarView.swift
//  BigBasket
//
//  Created by iPHTech34 on 15/11/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: String? = nil  // Track the selected tab
    @State private var hoveredTab: String? = nil   // Track the hovered tab
    var body: some View {
        HStack {
            // Home Tab
            VStack {
                Image(systemName: "house.fill")
                    .foregroundColor(tabColor(tab: "Home")) // Change icon color
                Text("Home")
                    .font(.caption)
                    .foregroundColor(tabColor(tab: "Home")) // Change text color
            }
            .onHover { hovering in
                hoveredTab = hovering ? "Home" : nil
            }
            .onTapGesture {
                selectedTab = "Home"
            }
            Spacer()
            
            // My Account Tab
            VStack {
                Image(systemName: "person.fill")
                    .foregroundColor(tabColor(tab: "My Account"))
                Text("My Account")
                    .font(.caption)
                    .foregroundColor(tabColor(tab: "My Account"))
            }
            .onHover { hovering in
                hoveredTab = hovering ? "My Account" : nil
            }
            .onTapGesture {
                selectedTab = "My Account"
            }
            Spacer()
            
            // Offers Tab
            VStack {
                Image(systemName: "cart.fill")
                    .foregroundColor(tabColor(tab: "Offers"))
                Text("Offers")
                    .font(.caption)
                    .foregroundColor(tabColor(tab: "Offers"))
            }
            .onHover { hovering in
                hoveredTab = hovering ? "Offers" : nil
            }
            .onTapGesture {
                selectedTab = "Offers"
            }
            Spacer()
            
            // Notifications Tab
            VStack {
                Image(systemName: "bell.fill")
                    .foregroundColor(tabColor(tab: "Notifications"))
                Text("Notifications")
                    .font(.caption)
                    .foregroundColor(tabColor(tab: "Notifications"))
            }
            .onHover { hovering in
                hoveredTab = hovering ? "Notifications" : nil
            }
            .onTapGesture {
                selectedTab = "Notifications"
            }
            Spacer()
            
            // Favorites Tab
            VStack {
                Image(systemName: "heart")
                    .foregroundColor(tabColor(tab: "Favorites"))
                Text("Favorites")
                    .font(.caption)
                    .foregroundColor(tabColor(tab: "Favorites"))
            }
            .onHover { hovering in
                hoveredTab = hovering ? "Favorites" : nil
            }
            .onTapGesture {
                selectedTab = "Favorites"
            }
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 2)
    }
    
    // Helper function to determine the color
    private func tabColor(tab: String) -> Color {
        if selectedTab == tab {
            return .green // If tab is selected, color is green
        } else if hoveredTab == tab {
            return .green // If hovered, color is green
        } else {
            return .gray // Default color for non-selected, non-hovered tabs
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
