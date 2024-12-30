//
//  SearchView.swift
//  BigBasket
//
//  Created by iPHTech34 on 18/11/24.
//

import SwiftUI
struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Spacer()
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 16)
        }
        .padding(.vertical, 8)
        .background(Color.white)
        .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)
    }
}
