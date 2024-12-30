//
//  AccountView.swift
//  LoginLogout
//
//  Created by iPHTech34 on 20/11/24.
//
import SwiftUI
struct AccountView: View {
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isAccountCreated: Bool = false // Track if the account is created
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) private var dismiss // For navigation handling
    var body: some View {
        VStack(spacing: 16) {
            Text("Please complete all information to create an account.")
                .font(.headline).fontWeight(.medium)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            InputView(
                placeholder: "Email or Phone number",
                text: $email
            )
            InputView(
                placeholder: "Full Name",
                text: $fullName
            )
            InputView(
                placeholder: "Password",
                isSecureField: true,
                text: $password
            )
            ZStack(alignment: .trailing) {
                InputView(
                    placeholder: "Confirm your password",
                    isSecureField: true,
                    text: $confirmPassword
                )
                Spacer()
                if !password.isEmpty && !confirmPassword.isEmpty {
                    Image(systemName: "\(isValidPassword ? "checkmark" : "xmark").circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(isValidPassword ? Color(.systemGreen) : Color(.systemRed))
                }
            }
            Spacer()
            Button {
                Task {
                    await authViewModel.createUser(
                        email: email,
                        fullName: fullName,
                        password: password
                    )
                    if !authViewModel.isError {
                        isAccountCreated = true // Mark account as created
                    }
                }
            } label: {
                Text("Create Account")
            }
            .buttonStyle(CapsuleButtonStyle())
            .alert("Account Created", isPresented: $isAccountCreated) {
                Button("OK") {
                    dismiss() // Navigate back to the login page
                }
            } message: {
                Text("Your account has been created successfully. Please log in with your credentials.")
            }
        }
        .navigationTitle("Set up your account")
        .toolbarRole(.editor)
        .padding()
    }
    var isValidPassword: Bool {
        confirmPassword == password
    }
}
#Preview {
    AccountView()
        .environmentObject(AuthViewModel())
}

