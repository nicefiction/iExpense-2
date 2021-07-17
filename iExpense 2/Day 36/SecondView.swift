//  SecondView.swift

import SwiftUI



struct SecondView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
   
   
   // MARK: - PROPERTIES
   
   var name: String
   
   
   // MARK: - COMPUTED PROPERTIES
   var body: some View {
      
      VStack {
         Button(action: {
            presentationMode.wrappedValue.dismiss()
         }, label: {
            Text("Done")
               .font(.title)
               .fontWeight(.semibold)
         })
         Spacer()
         Text("Hello \(name)")
         Spacer()
      }
      .padding()
   }
}





// MARK: - PREVIEWS -

struct SecondView_Previews: PreviewProvider {
   static var previews: some View {
      SecondView(name: "Glinda")
   }
}
