//
//  TitleView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/10/23.
//

import SwiftUI

struct TitleView: View {
  @State private var isAnimatedView = false

  var body: some View {
    VStack {
      Image("logo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .scaleEffect(x: 0.9, y: 0.9)
        .animation(.easeInOut(duration: 1.0))
        .opacity(isAnimatedView ? 1 : 0)
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isAnimatedView = true
          }
        }
        Text("Achieve your financial goals")
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .padding()
            .opacity(isAnimatedView ? 1 : 0)
            .onAppear {
                self.isAnimatedView = true
            }

    }
  }
}
