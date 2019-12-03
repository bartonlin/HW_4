//
//  Expense_list.swift
//  HW_4
//
//  Created by User17 on 2019/12/3.
//  Copyright © 2019 NTOU. All rights reserved.
//

import SwiftUI

struct Expense_list: View {
    
    @ObservedObject var expenses_data = Expense_data()
    @State private var show_Edit_expense = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(expenses_data.expenses) {
                    (expense) in NavigationLink(destination: Expense_editor(expense_data:self.expenses_data, editExpense: expense)){
                        Expense_row(expense: expense)
                        
                    }
                }
                .onDelete { (IndexSet) in
                    self.expenses_data.expenses.remove(atOffsets: IndexSet)
                }
            }
            .navigationBarTitle("花費列表")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                
                self.show_Edit_expense = true
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                
            }))
            .sheet(isPresented: $show_Edit_expense){
                NavigationView{
                    Expense_editor(expense_data: self.expenses_data)
                }
            }
        }
    }
}

struct Expense_list_Previews: PreviewProvider {
    static var previews: some View {
        Expense_list()
    }
}
