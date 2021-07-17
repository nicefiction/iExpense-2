//  HumanView.swift

import SwiftUI



struct Human: Codable {
   
   var firstName: String
   var lastName: String
}



struct HumanView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var human = Human(firstName: "Dorothy",
                                    lastName: "Gale")
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Button("Save Human",
             action: {
               let encoder = JSONEncoder()
               
               if let _human = try? encoder.encode(human) {
                  UserDefaults.standard.set(_human,
                                            forKey: "Human")
               }
             })
   }
}





// MARK: - PREVIEWS -

struct HumanView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      HumanView()
   }
}
