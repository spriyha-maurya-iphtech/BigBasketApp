//
//  SplashView.swift
//  Login
//
//  Created by iPHTech34 on 04/12/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Background color

            VStack {
                Image("BigBasketLogo") // Replace with your logo's asset name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)

                Text("Welcome to My App")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
            }
        }
    }
}
