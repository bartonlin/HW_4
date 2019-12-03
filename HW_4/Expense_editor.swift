//
//  Expense_editor.swift
//  HW_4
//
//  Created by User17 on 2019/12/3.
//  Copyright © 2019 NTOU. All rights reserved.
//

import SwiftUI

struct Expense_editor: View {
    @Environment(\.presentationMode) var presentationMode
    var expense_data: Expense_data
    @State private var cost_reason = ""
    @State private var count = 0
    var editExpense: Expense?
    
    var body: some View {
        Form {
            TextField("花費原因", text: $cost_reason)
            Stepper("花費 \(count) 元", value: $count, in:1...10000)
        }
        .navigationBarTitle(editExpense == nil ? "新增花費" : "編輯花費")
        .navigationBarItems(trailing: Button("Save"){
            let expense = Expense(cost_reason: self.cost_reason, count: self.count)
            if let editExpense = self.editExpense {
                let index = self.expense_data.expenses.firstIndex {
                    return $0.id == editExpense.id
                }!
                self.expense_data.expenses[index] = expense
            } else {
                self.expense_data.expenses.insert(expense, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
        })
        .onAppear {
            if let editExpense = self.editExpense {
                self.cost_reason = editExpense.cost_reason
                self.count = editExpense.count
            }
        }
    }
}

struct Expense_editor_Previews: PreviewProvider {
    static var previews: some View {
        Expense_editor(expense_data: Expense_data())
    }
}
