//
//  StartUpView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/10/23.
//

import SwiftUI

struct StartUpView: View {
    @State private var loginSuccess: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                if loginSuccess {
                    BudgetView()
                } else {
                    VStack {
                        NavigationLink(destination: LoginView(loginSuccess: $loginSuccess)) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.blue)
                                .cornerRadius(15.0)
                        }

                        NavigationLink(destination: SignupView()) {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.blue)
                                .cornerRadius(15.0)
                        }
                    }
                }
            }
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartUpView()
    }
}

