//
//  Home.swift
//  BigBasket
//
//  Created by iPHTech34 on 22/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var showSideMenu = false
    @EnvironmentObject var authViewModel: AuthViewModel
   // @EnvironmentObject var cartViewModel: CartViewModel
    var body: some View {
        if let user = authViewModel.currentUser {
        ZStack {
            // Main content
            VStack(spacing: 0) {
                // Top Title Bar
                TopTitleView(showSideMenu: $showSideMenu)
                 //   .environmentObject(cartViewModel)
                // Search Bar Section
                SearchBarView(searchText: $searchText)
                
                // Top Banner
                TopBannerView()
                
                // Scrollable Content Section
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Categories Section
                        CategoriesSectionView()
                        
                        // Fresh Produce Section
                        Spacer()
                        FreshProduceSectionView()
                        Spacer()
                        // Bottom Banner Section
                        BottomBannerView()
                    }
                    .padding(.horizontal)
                }
                
                // Tab Bar at the Bottom
                TabBarView()
            }
            .edgesIgnoringSafeArea(.bottom)
            
            // Side Menu
            if showSideMenu {
                SideMenuView()
                    .environmentObject(authViewModel)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .transition(.move(edge: .leading))
                    .zIndex(1)
                    .background(
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                withAnimation {
                                    showSideMenu = false
                                }
                            }
                    )
            }
        }
    }
}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
