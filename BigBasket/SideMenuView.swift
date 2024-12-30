//
//  SideMenuView.swift
//  login
//
//  Created by iPHTech34 on 22/11/24.
//
import SwiftUI
struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        VStack(alignment: .leading) {
                    if let currentUser = authViewModel.currentUser {
                        Text(currentUser.fullName)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
            
            Text("5th Stage, RR Nagar, Bangalore-560098")
                .font(.subheadline)
                .padding(.bottom)

            HStack {
                Text("Your next available slot")
                .font(.subheadline)
                Spacer()
            }
            .padding(.vertical, 4)
            
            Text("Tomorrow 9:30 am - 10:30 am")
                .font(.footnote)
                .padding(.bottom, 8)
            
            Button(action: {
                // Handle membership sign-up action
            }) {
                Text("Get priority slots with BBstar membership")
                    .font(.footnote)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding(.bottom)
            
            Divider()
            
            // Menu Items
            Group {
                MenuItem(title: "Account")
                MenuItem(title: "Smart Basket")
                MenuItem(title: "Orders")
                MenuItem(title: "Saved for later")
                MenuItem(title: "Saved Blogs")
                MenuItem(title: "Notification", badge: "NEW")
                MenuItem(title: "Membership", badge: "NEW")
                MenuItem(title: "Customer Support")
                MenuItem(title: "FAQs")
            }
            
            Spacer()
            Button(action: {
                           authViewModel.signOut()
                       }) {
                           HStack {
                               Image(systemName: "arrow.backward.square")
                                   .font(.title3)
                               Text("Sign Out")
                                   .fontWeight(.bold)
                                   .font(.body)
                           }
                           .padding()
                           .foregroundColor(.red)
                       }
                       .frame(maxWidth: .infinity, alignment: .leading)
                       .padding(.bottom, 16)
                   
        }
        .padding()
        .frame(maxWidth: 300) // Adjust width for the menu
        //.background(Color.white)
        .background(Color(red: 242 / 255, green: 252 / 255, blue: 235 / 255))
        .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 0)
    }
}

struct MenuItem: View {
    let title: String
    let badge: String?

    init(title: String, badge: String? = nil) {
        self.title = title
        self.badge = badge
    }

    var body: some View {
        HStack {
            Text(title)
                .font(.body)
            Spacer()
            if let badge = badge {
                Text(badge)
                    .font(.caption)
                    .padding(4)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            }
        }
        .padding(.vertical, 4)
    }
}
