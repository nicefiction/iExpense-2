// ExpenseItems.swift
/* MARK: - SOURCES -
 
 * https://www.simpleswiftguide.com/how-to-use-userdefaults-in-swift/ // S1
 * https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
 * https://developer.apple.com/documentation/foundation/userdefaults
 */
// MARK: - LIBRARIES -

import Foundation



class Expenses: ObservableObject {
   
   // MARK: - PROPERTIES
   
   @Published var items = Array<ExpenseItem>() {
      
      didSet {
         let jsonEncoder = JSONEncoder()
         
         if let _encodedItems = try? jsonEncoder.encode(items) {
            // S1 : Stores a custom object in UserDefaults :
            UserDefaults.standard.set(_encodedItems,
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
   /**
    We use a custom initializer for the `Expenses` class ,
    so that when we make an instance of it
    we load any saved `data` from `UserDefaults` .
    */
   init() {
      
      // 1. Reads whatever is in “Items” as a Data object :
      // S1 : Reads custom objects from UserDefaults .
      // OPTION A — PAUL HUDSON / Returns the data object associated with the specified key :
      // if let _savedItems = UserDefaults.standard.data(forKey: "Items") {
      // OPTION B — SIMPLE SWIFT GUIDE / Returns the object associated with the specified key :
      if let _savedItems = UserDefaults.standard.object(forKey: "Items") as? Data {
         /**
          `NOTE` OLIVIER :
          OPTION B returns `nil` while OPTION A returns `0` when the value does not exist .
          OPTION B is therefore preferable as it might be confusing when using Integer values .
          `S1` :
          You have to be careful when using other get methods because some of them might surprise you .
          For example , when using the `integer(forKey:)` method ,
          it returns `0` in absence of the specified key .
          In order to unify this behavior across your app ,
          you can always use the `object(forKey:)` method when reading data from `UserDefaults` .
          It guarantees you to return `nil` in case the given key is absent.
          */
         
         let jsonDecoder = JSONDecoder()
         
         // 2. Unarchives the Data object into an Array of ExpenseItems :

         if let _decodedItems = try? jsonDecoder.decode([ExpenseItem].self,
                                                        from: _savedItems) {
            self.items = _decodedItems
            return
         }
         
         self.items = Array<ExpenseItem>()
      }
   }
}
