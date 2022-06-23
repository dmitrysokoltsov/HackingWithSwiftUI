//
//  Expense.swift
//  iExpense
//
//  Created by Dmitry Sokoltsov on 06.06.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExepenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExepenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
