//
//  AuthViewModel.swift
//  LoginLogout
//
//  Created by iPHTech34 on 20/11/24.
//

import Foundation
import FirebaseAuth // Auth
import FirebaseFirestore // Storage

//@MainActor
//final class AuthViewModel: ObservableObject {
//    @Published var userSession: FirebaseAuth.User?
//    @Published var currentUser: User?
//    @Published var isError: Bool = false
//    private let auth = Auth.auth()
//    private let firestore = Firestore.firestore()
//    
//    init(){
//            Task {
//                await loadCurrentUser()
//            }
//        }
//    func loadCurrentUser() async {
//            if let user = auth.currentUser {
//                userSession = user
//                await fetchUser(by: user.uid)
//            }
//        }
//    func login(email: String, password: String) async {
//            do {
//                let authResult = try await auth.signIn(withEmail: email, password: password)
//                userSession = authResult.user
//                await fetchUser(by: authResult.user.uid)
//                print("current user", currentUser)
//            }catch {
//                isError = true
//            }
//        }
//    func createUser(email: String, fullName: String, password: String) async {
//            do {
//                // auth mai user ki entry kar rahe ho
//                let authResult = try await auth.createUser(withEmail: email, password: password)
//                // database user ki extra details store kar rahe ho
//                await storeUserInFirestore(uid: authResult.user.uid, email: email, fullName: fullName)
//            }catch {
//                isError = true
//            }
//        }
//    func storeUserInFirestore(uid: String, email: String, fullName: String) async {
//            let user = User(uid: uid, email: email, fullName: fullName)
//            do {
//                try firestore.collection("users").document(uid).setData(from: user)
//            }catch {
//                isError = true
//            }
//        }
//    func fetchUser(by uid: String) async {
//           do {
//               let document = try await firestore.collection("users").document(uid).getDocument()
//               currentUser = try document.data(as: User.self)
//           }catch {
//               isError = true
//           }
//       }
//    func signOut() {
//          do {
//              userSession = nil
//              currentUser = nil
//              try auth.signOut()
//          }catch {
//              isError = true
//          }
//      }
//}

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isError: Bool = false

    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()

    init() {
        Task {
            await loadCurrentUser()
        }
    }

    /// Load the current user session (lightweight startup task)
    func loadCurrentUser() async {
        if let user = auth.currentUser {
            userSession = user
            // Defer heavy operations like fetching user details
            Task {
                await fetchUser(by: user.uid)
            }
        }
    }

    // Fetch user details from Firestore (non-blocking)
    func fetchUser(by uid: String) async {
        do {
            let document = try await firestore.collection("users").document(uid).getDocument()
            currentUser = try document.data(as: User.self)
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            isError = true
        }
    }

    func login(email: String, password: String) async {
        do {
            let authResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authResult.user
            await fetchUser(by: authResult.user.uid)
        } catch {
            print("Error logging in: \(error.localizedDescription)")
            isError = true
        }
    }

    func createUser(email: String, fullName: String, password: String) async {
        do {
            let authResult = try await auth.createUser(withEmail: email, password: password)
            await storeUserInFirestore(uid: authResult.user.uid, email: email, fullName: fullName)
        } catch {
            print("Error creating user: \(error.localizedDescription)")
            isError = true
        }
    }

    func storeUserInFirestore(uid: String, email: String, fullName: String) async {
        let user = User(uid: uid, email: email, fullName: fullName)
        do {
            try firestore.collection("users").document(uid).setData(from: user)
        } catch {
            print("Error storing user in Firestore: \(error.localizedDescription)")
            isError = true
        }
    }

    func signOut() {
        do {
            userSession = nil
            currentUser = nil
            try auth.signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
            isError = true
        }
    }
}
