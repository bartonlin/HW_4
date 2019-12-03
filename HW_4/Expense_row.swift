//
//  Expense_row.swift
//  HW_4
//
//  Created by User17 on 2019/12/3.
//  Copyright © 2019 NTOU. All rights reserved.
//

import SwiftUI

struct Expense_row: View {
    
    var expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.cost_reason)
            Spacer()
            Text("\(expense.count)")
        }
    }
}

struct Expense_row_Previews: PreviewProvider {
    static var previews: some View {
        Expense_row(expense: Expense(cost_reason: "停車費", count: 20))
    }
}
