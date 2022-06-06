//
//  Expense.swift
//  iExpense
//
//  Created by Dmitry Sokoltsov on 06.06.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExepenseItem]()
}
