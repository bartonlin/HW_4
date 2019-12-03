//
//  expense.swift
//  HW_4
//
//  Created by User17 on 2019/12/3.
//  Copyright © 2019 NTOU. All rights reserved.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()
    var cost_reason: String
    var count: Int
}
