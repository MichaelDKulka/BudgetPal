//
//  BudgetView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/11/23.
//

import SwiftUI

struct BudgetView: View {
    @State private var valueData: [ValueData] = [
        ValueData(amount: "100", description: "Groceries"),
        ValueData(amount: "200", description: "Rent"),
        ValueData(amount: "50", description: "Utilities"),
        ValueData(amount: "75", description: "Entertainment")
    ]

    @State private var showingForm = false
    @State private var newValueData = ValueData(amount: "", description: "")

    var body: some View {
        VStack {
            JumbotronView(number: 100)
            DisplayOutFlowView(valueData: valueData)
            if showingForm {
                EnterValueView(amount: $newValueData.amount, description: $newValueData.description)
                HStack {
                    Button("Submit") {
                        valueData.append(newValueData)
                        newValueData = ValueData(amount: "", description: "")
                        showingForm = false
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Button("Cancel") {
                        showingForm = false
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            } else {
                Button("Add Expense") {
                    showingForm = true
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}


struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}

