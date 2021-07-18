//  AddView.swift

import SwiftUI



struct AddView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
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
               .keyboardType(.numberPad)
         }
         .navigationBarTitle(Text("New Expense Item"))
         .navigationBarItems(trailing: Button("Done",
                                              action: {
                                                if
                                                   let _amount =  Int(amount) {
                                                   let newItem = ExpenseItem(name: name,
                                                                             type: type,
                                                                             amount: _amount)
                                                   
                                                   expenses.items.append(newItem)
                                                }
                                                presentationMode.wrappedValue.dismiss()
                                              }))
      }
   }
}





// MARK: - PREVIEWS -

struct AddView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      AddView(expenses: Expenses())
   }
}
