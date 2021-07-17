//  NumbersView.swift

import SwiftUI



struct NumbersView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var currentNumber: Int = 0
   @State private var numbers = Array<Int>()
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         VStack {
            List {
               ForEach(numbers,
                       id: \.self,
                       content: {
                        
                        Text("\($0)")
                    })
                  .onDelete(perform: removeRows)
            }
            Button("Add Number" ,
                   action: {
                     currentNumber += 1
                     numbers.append(currentNumber)
                   })
         }
         .navigationBarItems(trailing: EditButton())
      }
   }
   
   
   // MARK: - METHODS
   
   func removeRows(atOffsets offsets: IndexSet) {
      
      numbers.remove(atOffsets: offsets)
   }
}






// MARK: - PREVIEWS -

struct NumbersView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      NumbersView()
   }
}
