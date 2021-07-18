//  ExpenseItems.swift

import Foundation


class Expenses: ObservableObject {
   
   @Published var items = Array<ExpenseItem>()
}
