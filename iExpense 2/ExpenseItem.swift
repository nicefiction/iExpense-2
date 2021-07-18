//  ExpenseItem.swift

import Foundation



struct ExpenseItem: Identifiable {
   
   let id: UUID = UUID()
   var name: String
   var type: String
   var amount: Int
}
