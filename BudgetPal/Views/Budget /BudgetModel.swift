//
//  BudgetModel.swift
//  BudgetPal
//
//  Created by Michael Kulka on 6/11/23.
//

import Firebase

struct Expense {
    var description: String
    var amount: Double
}

struct Budget {
    var id: String
    var title: String
    var total: Double
    var month: Date
    var sharedWith: [String]
    var expenses: [Expense]
}

class BudgetModel {
    let db = Firestore.firestore()

    func addExpense(budget: Budget, expense: Expense) {
        let budgetRef = db.collection("users").document(budget.id).collection("budgets").document(budget.id)
        
        budgetRef.collection("expenses").addDocument(data: [
            "description": expense.description,
            "amount": expense.amount
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(budgetRef.documentID)")
            }
        }
    }

    func createBudget(userID: String, budget: Budget) {
        let budgetsRef = db.collection("users").document(userID).collection("budgets")
        
        budgetsRef.document(budget.id).setData([
            "title": budget.title,
            "total": budget.total,
            "month": budget.month,
            "sharedWith": budget.sharedWith
        ]) { err in
            if let err = err {
                print("Error creating budget: \(err)")
            } else {
                print("Budget created with ID: \(budget.id)")
            }
        }
    }
}

