//  ExpenseItems.swift

import Foundation


class Expenses: ObservableObject {
   
   // MARK: - PROPERTIES
   
   @Published var items = Array<ExpenseItem>() {
      didSet {
         let jsonEncoder = JSONEncoder()
         if
            let _unkeyedEncodedContainer = try? jsonEncoder.encode(items) {
            UserDefaults.standard.set(_unkeyedEncodedContainer,
                                      forKey: "Items")
         }
      }
   }
   
   
   
   // MARK: - INITIALIZER METHODS:
   
   init() {
      // 1. Reads whatever is in “Items” as a Data object :
      if
         let _items = UserDefaults.standard.data(forKey: "Items") {
         
         let jsonDecoder = JSONDecoder()
         
         // 2. Unarchives the Data object into an Array of ExpenseItems :
         if
            let _unkeyedDecodedContainer = try? jsonDecoder.decode([ExpenseItem].self,
                                                                   from: _items) {
            self.items = _unkeyedDecodedContainer
            return
         }
         
         self.items = Array<ExpenseItem>()
      }
   }
}
