//
//  SignUpView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/10/23.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var error = ""

    private func signup() {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
                // Navigate to another view or show success message
            }
        }
    }

    var body: some View {
        VStack {
            Text("Create Account")
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: signup) {
                Text("Sign Up")
            }
            if !error.isEmpty {
                Text(error)
            }
        }.padding()
    }
}
