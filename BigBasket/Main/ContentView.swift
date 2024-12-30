//
//  ContentView.swift
//  login
//
//  Created by iPHTech34 on 22/11/24.
//

import SwiftUI

//struct ContentView: View {
//    @EnvironmentObject var authViewModel: AuthViewModel
//   // @EnvironmentObject var cartViewModel = CartViewModel
//    var body: some View {
//        NavigationStack {
//            Group {
//                if authViewModel.userSession == nil {
//                    LoginView()
//                }else {
//                    //ProfileView()
//                    HomeView()
//                       // .environmentObject(cartViewModel)
//                }
//            }
//            .environmentObject(authViewModel)
//        }
//    }
//}
//struct ContentView: View {
//    @EnvironmentObject var authViewModel: AuthViewModel
//    @State private var showSplash = true // State to control splash screen visibility
//
//    var body: some View {
//        ZStack {
//            if showSplash {
//                SplashView()
//            } else {
//                NavigationStack {
//                    Group {
//                        if authViewModel.userSession == nil {
//                            LoginView()
//                        } else {
//                            HomeView()
//                        }
//                    }
//                    .environmentObject(authViewModel)
//                }
//            }
//        }
//        .onAppear {
//            // Simulate splash screen delay
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                showSplash = false
//                
//                
//            }
//        }
//    }
//}
//struct ContentView: View {
//    @EnvironmentObject var authViewModel: AuthViewModel
//    @State private var isReady = false // Tracks when resources are ready
//    
//    var body: some View {
//        ZStack {
//            if !isReady {
//                SplashView()
//            } else {
//                NavigationStack {
//                    Group {
//                        if authViewModel.userSession == nil {
//                            LoginView()
//                        } else {
//                            HomeView()
//                        }
//                    }
//                    .environmentObject(authViewModel)
//                }
//            }
//        }
//        .task {
//            // Ensure all critical tasks are complete before moving forward
//            await initializeApp()
//        }
//        
//    }
//    private func initializeApp() async {
//        async let minimumDuration = Task.sleep(nanoseconds: 1_000_000_000) // 2 seconds
//        async let loadResources = loadUserResources()
//        
//        // Await the asynchronous tasks with error handling
//        do {
//            _ = try await (minimumDuration, loadResources)
//        } catch {
//            // Handle the error here if needed
//            print("Error loading resources: \(error)")
//        }
//        
//        withAnimation {
//            isReady = true
//        }
//    }
//    
//    private func loadUserResources() async throws {
//        try await authViewModel.loadCurrentUser()
//    }
//}
struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var isReady = false // Tracks when resources are ready
    
    var body: some View {
        ZStack {
            if !isReady {
                SplashView()
            }
            else {
                NavigationStack {
                    Group {
                        if authViewModel.userSession == nil {
                            LoginView()
                        } else {
                            HomeView()
                        }
                    }
                    .environmentObject(authViewModel)
                }
            }
        }
        .task {
            // Ensure all critical tasks are complete before moving forward
            await initializeApp()
        }
    }

    private func initializeApp() async {
        // Await the asynchronous tasks with error handling
        do {
            // Load user resources asynchronously
            try await loadUserResources()
            // Firebase initialization is automatically handled by AppDelegate, no need to await it here

            // Now, set the app as ready after the resources are loaded
            withAnimation {
                isReady = true
            }
        } catch {
            // Handle the error here if needed
            print("Error loading resources: \(error)")
        }
    }

    private func loadUserResources() async throws {
        // Load current user asynchronously, can also check for Firebase auth status
        try await authViewModel.loadCurrentUser()
    }
}
#Preview {
    ContentView()
}
