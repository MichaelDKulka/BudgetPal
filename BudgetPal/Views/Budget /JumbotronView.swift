//
//  JumbotronView.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/10/23.
//

import SwiftUI

struct JumbotronView: View {
    @State private var number: Int
    
    var body: some View {
        VStack {
            Text("Jumbotron Title")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Number: \(number)")
                .font(.title)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.blue.opacity(0.2))
        .cornerRadius(15)
        .padding()
        .task {
            do {
                let result = try await fetchNumber()
                number = result
            } catch {
                // Handle error
                print(error.localizedDescription)
            }
        }
    }
    
    init(number: Int) {
        _number = State(initialValue: number)
    }
    
    func fetchNumber() async throws -> Int {
        // Simulate a network request or some long-running task
        await Task.sleep(2 * 1_000_000_000)  // Sleep for 2 seconds
        return 10
    }
}

struct JumbotronView_Previews: PreviewProvider {
    static var previews: some View {
        JumbotronView(number: 0)
    }
}

