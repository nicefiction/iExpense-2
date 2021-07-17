//  User.swift

import Foundation


class User: ObservableObject {
   
   @Published var firstName: String = "Dorothy"
   @Published var lastName: String = "Gale"
}
