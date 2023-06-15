//
//  LoginView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/10/23.
//
import SwiftUI
import FirebaseAuth

struct NavigationStackView: View {
    @State private var loginSuccess = false

    var body: some View {
        NavigationView {
            if loginSuccess {
                BudgetView()
            } else {
                LoginView(loginSuccess: $loginSuccess)
            }
        }
    }
}

struct LoginView: View {
    @Binding var loginSuccess: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()

            SecureField("Password", text: $password)
                .padding()

            Button(action: {
                self.login()
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .disabled(isLoading)

            if isLoading {
                ProgressView()
            }
        }
        .navigationBarTitle("Login")
    }

    func login() {
        isLoading = true

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            self.isLoading = false

            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Logged in!")
                loginSuccess = true
            }
        }
    }
}

