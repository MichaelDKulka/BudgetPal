//
//  LoginView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/10/23.
//
import SwiftUI
import FirebaseAuth

struct LoginView: View {
  @State private var email = ""
  @State private var password = ""
  @State private var isLoading = false

  var body: some View {
    VStack {
      TitleView()
        .padding(.bottom, 50) // Spacing between title and form

      VStack {
        TextField("Email", text: $email)
          .padding()

        SecureField("Password", text: $password) // secure input for password
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
    }
  }

  func login() {
    isLoading = true

    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      self.isLoading = false

      if let error = error {
        print(error.localizedDescription)
      } else {
        print("Logged in!")
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
