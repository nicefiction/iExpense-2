//  ContentView.swift

import SwiftUI



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @ObservedObject var expenses = Expenses()
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(expenses.items,
                    id: \.name,
                    content: { (item: ExpenseItem) in
                     Text("\(item.name)")
                    })
               .onDelete(perform: removeItems)
         }
         .navigationBarTitle(Text("iExpense"))
         // .navigationBarItems(trailing: EditButton())
         .navigationBarItems(
            leading: Button(
               action: {
                  let newExpense = ExpenseItem(name: "Test expense",
                                               type: "Personnal",
                                               amount: 5)
                  
                  expenses.items.append(newExpense)
               },
               label: {
                  Image(systemName: "plus.circle")
                     .font(.largeTitle)
               }),
            trailing: EditButton()
         )
      }
   }
   
   
   // MARK: - METHODS
   
   func removeItems(atOffsets offsets: IndexSet) {
      
      expenses.items.remove(atOffsets: offsets)
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
