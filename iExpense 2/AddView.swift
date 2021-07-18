//  AddView.swift

import SwiftUI



struct AddView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @ObservedObject var expenses: Expenses
   @State private var name: String = ""
   @State private var type: String = "Leisure"
   @State private var amount: String = ""
   
   
   // MARK: - PROPERTIES
   
   let types: [String] = [ "Leisure" , "Business" ]
   
   
   // MARK: COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         Form {
            TextField("name", text: $name)
            Picker("Expense type",
                   selection: $type,
                   content: {
                     ForEach(types,
                             id: \.self,
                             content: { (type: String) in
                              Text(type)
                             })
                   })
            TextField("amount",
                      text: $amount)
         }
         .navigationBarTitle(Text("New Expense Item"))
      }
   }
}





// MARK: - PREVIEWS -

struct AddView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      AddView(expenses: Expenses())
   }
}
