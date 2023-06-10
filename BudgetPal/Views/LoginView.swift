//
//  LoginView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/10/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var error = ""
    var body: some View {
        VStack {
            Text("Login")
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: login) {
                Text("Login")
            }
            if !error.isEmpty {
                Text(error)
            }
        }
    }

    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
