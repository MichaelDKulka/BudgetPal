//
//  StartUpView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/10/23.
//

import SwiftUI

struct AuthView: View {
    @State private var showSignUp = false

    var body: some View {
        VStack {
            if showSignUp {
                SignupView()
            } else {
                LoginView()
            }

            Button(action: {
                showSignUp.toggle()
            }) {
                Text(showSignUp ? "Already have an account? Login!" : "Don't have an account? Sign Up!")
            }
        }
    }
}
