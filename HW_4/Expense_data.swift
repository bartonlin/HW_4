//
//  expense_data.swift
//  HW_4
//
//  Created by User17 on 2019/12/3.
//  Copyright © 2019 NTOU. All rights reserved.
//

import Foundation

class Expense_data: ObservableObject {
    
    @Published var expenses = [Expense]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(expenses) {
                UserDefaults.standard.set(data, forKey: "expenses")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "expenses") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Expense].self, from: data) {
                expenses = decodedData
            }
        }
    }
    
}
