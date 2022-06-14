//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Dmitry Sokoltsov on 06.06.2022.
//

import Foundation

struct ExepenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
