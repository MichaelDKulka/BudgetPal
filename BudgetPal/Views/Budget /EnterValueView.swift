//
//  EnterValueView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/11/23.
//

import SwiftUI

struct EnterValueView: View {
    @Binding var amount: String
    @Binding var description: String

    var body: some View {
        VStack {
            Text("Enter Details")
                .font(.largeTitle)
                .padding()

            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()

            TextField("Description", text: $description)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
        }
    }
}
