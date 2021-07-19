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
      /**
       We use a `didSet` property observer on the `items` property of `Expenses`,
       so that whenever an item gets added or removed
       we will write out changes .
       */
   }
   
   
   
   // MARK: - INITIALIZER METHODS:
   // SOURCE: https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
   
   /**
    We use a custom initializer for the `Expenses` class ,
    so that when we make an instance of it
    we load any saved `data` from `UserDefaults` .
    */
   init()
   throws {
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

/*
 struct Bread: Codable {
     
     let id: Int
     let name: String
     let bakery: String
     
     // STEP 1 of 3 , CodingKeys :
     enum CodingKeys: String ,
                      CodingKey {
         case id
         case name
         case bakery
     }
     
     // STEP 2 of 3 , init(decoder) :
     init(from decoder: Decoder)
     throws {
         
         let jsonContainer = try decoder.container(keyedBy : CodingKeys.self)
         
         self.id     = try jsonContainer.decode(Int.self ,    forKey : CodingKeys.id)
         self.name   = try jsonContainer.decode(String.self , forKey : CodingKeys.name)
         self.bakery = try jsonContainer.decode(String.self , forKey : CodingKeys.bakery)
     }
     
     // STEP 3 of 3 , encode(to) :
     func encode(to encoder: Encoder)
     throws {
         
         var jsonContainer = encoder.container(keyedBy : CodingKeys.self)
         
         try jsonContainer.encode(id ,     forKey : CodingKeys.id)
         try jsonContainer.encode(name ,   forKey : CodingKeys.name)
         try jsonContainer.encode(bakery , forKey : CodingKeys.bakery)
     }
 }
 */
