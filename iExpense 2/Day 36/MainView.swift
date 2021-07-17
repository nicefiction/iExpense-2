//  MainView.swift

import SwiftUI



struct MainView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isShowingSecondView: Bool = false
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Button("Show Sheet" ,
             action: {
               print("The button is tapped.")
               isShowingSecondView.toggle()
             })
         .sheet(isPresented: $isShowingSecondView,
                content: {
                  SecondView(name: "Ozma")
         })
   }
}





// MARK: - PREVIEWS -

struct MainView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      MainView()
   }
}
