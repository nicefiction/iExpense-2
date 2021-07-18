//  ContentView.swift

import SwiftUI



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @ObservedObject var expenses = Expenses()
   @State private var isShowingSheet: Bool = false
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(expenses.items,
                    // id: \.name,
                    // id: \.id,
                    content: { (item: ExpenseItem) in
                     HStack {
                        VStack(alignment: .leading) {
                           Text("\(item.name)")
                              .font(.headline)
                           Text("\(item.type)")
                        }
                        Spacer()
                        Text("$\(item.amount)")
                           .font(.title)
                           .fontWeight(.semibold)
                           .padding(.trailing)
                     }
                    })
               .onDelete(perform: removeItems)
         }
         .navigationBarTitle(Text("iExpense"))
         // .navigationBarItems(trailing: EditButton())
         .navigationBarItems(
            leading: Button(
               action: {
                  isShowingSheet.toggle()
               },
               label: {
                  Image(systemName: "plus.circle")
                     .font(.largeTitle)
               }),
            trailing: EditButton()
         )
         .sheet(isPresented: $isShowingSheet,
                content: {
                  AddView(expenses: expenses)
         })
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
