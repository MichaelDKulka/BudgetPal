//
//  DisplayOutFlowView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/11/23.
//

import SwiftUI

struct ValueData {
    var amount: String
    var description: String
}

struct DisplayOutFlowView: View {
    let valueData: [ValueData]

    var body: some View {
        List(valueData, id: \.description) { data in
            VStack(alignment: .leading) {
                Text("Amount: \(data.amount)")
                Text("Description: \(data.description)")
            }
            .padding()
        }
    }
}

struct DisplayOutFlowView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayOutFlowView(valueData: [
            ValueData(amount: "100", description: "Groceries"),
            ValueData(amount: "200", description: "Rent"),
            ValueData(amount: "50", description: "Utilities"),
            ValueData(amount: "75", description: "Entertainment")
        ])
    }
}
