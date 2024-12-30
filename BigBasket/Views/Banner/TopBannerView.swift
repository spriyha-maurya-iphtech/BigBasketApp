//
//  TopBannerView.swift
//  BigBasket
//
//  Created by iPHTech34 on 15/11/24.
//

import SwiftUI

struct TopBannerView: View {
    
    @State private var selectedIndex = 0
    private let bannerImages = ["Sale1", "Sale4", "Sale3"] // Replace with your actual image names
    var body: some View {
        VStack {
            // Banner Slider
            TabView(selection: $selectedIndex) {
                ForEach(0..<bannerImages.count, id: \.self) { index in
                    Image(bannerImages[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity) // Ensures full screen width
                        .frame(height: 130)
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hides built-in dots
            .frame(height: 130)

            // Custom Dots Indicator
            HStack(spacing: 8) {
                ForEach(0..<bannerImages.count, id: \.self) { index in
                    Circle()
                        .fill(index == selectedIndex ? Color.blue : Color.gray)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.top, 8)
        }
        .frame(maxWidth: .infinity) // Ensures full screen width
        .padding(.horizontal) // Optional for a better layout look
    }
}

struct TopBannerView_Previews: PreviewProvider {
    static var previews: some View {
        TopBannerView()
    }
}
