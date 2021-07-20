//  AddView.swift

import SwiftUI



struct AddExpenseItemView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
   @ObservedObject var expenses: Expenses
   @State private var name: String = ""
   @State private var type: String = "Leisure"
   @State private var amount: String = ""
   @State private var isShowingAlert: Bool = false
   
   
   // MARK: - PROPERTIES
   
   let types: [String] = [ "Leisure" , "Business" ]
   
   
   // MARK: COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         Form {
            TextField("name", text: $name)
            Picker("Expense type",
                   selection: $type) {
               ForEach(types, id: \.self) { (type: String) in
                  Text(type)
               }
            }
            .pickerStyle(SegmentedPickerStyle())
            TextField("amount", text: $amount)
               .keyboardType(.numberPad)
         }
         .navigationBarTitle(Text("New Expense Item"))
         .navigationBarItems(trailing: Button("Done") {
            if
               let _amount =  Int(amount) {
               let newItem = ExpenseItem(name: name,
                                         type: type,
                                         amount: _amount)

               expenses.items.append(newItem)
               presentationMode.wrappedValue.dismiss()
            } else {
               isShowingAlert.toggle()
            }
         })
         .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Error"),
                  message: Text("You need to enter a number ."),
                  dismissButton: .cancel(Text("OK")))
         }
      }
   }
}





// MARK: - PREVIEWS -

struct AddView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      AddExpenseItemView(expenses: Expenses())
   }
}
