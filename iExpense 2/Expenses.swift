//  ExpenseItems.swift

import Foundation


class Expenses: ObservableObject {
   
   // MARK: - PROPERTIES
   
   /*
    didSet {
        // The  didSet property observer on the list property of Expenses , writes out changes whenever an item gets added or removed :
        let encoder = JSONEncoder()
        
        if let _encoded = try? encoder.encode(list) {
            UserDefaults.standard.setValue(_encoded ,
                                           forKey : "Items")
        }
    }
    */
   
   @Published var items = Array<ExpenseItem>() {
      didSet {
         let jsonEncoder = JSONEncoder()
         if
            let _encodedItems = try? jsonEncoder.encode(items) {
            
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
   /* STORING CUSTOM OBJECTS IN USERDEFAULTS :
    https://www.simpleswiftguide.com/how-to-use-userdefaults-in-swift/
    
    let defaults = UserDefaults.standard
    let user = User(name: "Swift Guide", age: 22)

    let encoder = JSONEncoder()
    
    if let encodedUser = try? encoder.encode(user) {
    
        defaults.set(encodedUser,
                     forKey: "user")
    }
    */
   
   
   // MARK: - INITIALIZER METHODS:
   // SOURCE: https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
   // SOURCE: https://developer.apple.com/documentation/foundation/userdefaults
   
   /**
    We use a custom initializer for the `Expenses` class ,
    so that when we make an instance of it
    we load any saved `data` from `UserDefaults` .
    */
   init() {
      // 1. Reads whatever is in “Items” as a Data object :
      if
         let _savedItems = UserDefaults.standard.data(forKey: "Items") {
         // PAUL HUDSON / APPLE : Returns the data object associated with the specified key.
         
         // let _savedItems = UserDefaults.standard.object(forKey: "Items") as? Data {
         // SIMPLE SWIFT GUIDE / APPLE : Returns the object associated with the specified key.
         
         let jsonDecoder = JSONDecoder()
         
         // 2. Unarchives the Data object into an Array of ExpenseItems :
         if
            let _decodedItems = try? jsonDecoder.decode([ExpenseItem].self,
                                                        from: _savedItems) {
            self.items = _decodedItems
            return
         }
         
         self.items = Array<ExpenseItem>()
      }
      /* READING CUSTOM OBJECTS FROM USERDEFAULTS :
       https://www.simpleswiftguide.com/how-to-use-userdefaults-in-swift/
       
       if let savedUserData = defaults.object(forKey: "user") as? Data {
       
           let decoder = JSONDecoder()
       
           if let savedUser = try? decoder.decode(User.self,
                                                  from: savedUserData) {
       
               print("Saved user: \(savedUser)")
           }
       }
       */
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
