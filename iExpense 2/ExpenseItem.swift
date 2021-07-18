//  ExpenseItem.swift

import Foundation



struct ExpenseItem: Identifiable,
                    Codable {
   
   let id: UUID = UUID()
   var name: String
   var type: String
   var amount: Int
}
