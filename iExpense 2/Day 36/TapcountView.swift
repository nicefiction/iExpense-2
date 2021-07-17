//  TapcountView.swift

import SwiftUI



struct TapcountView: View {
   
   // MARK: - PROPERTIES
   
   // @State private var tapCount: Int = 0
   @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Button(action: {
         tapCount += 1
         UserDefaults.standard.set(tapCount,
                                   forKey: "Tap")
      }, label: {
         Text("Tap Count : \(tapCount)")
            .font(.title)
      })
   }
}





// MARK: - PREVIEWS -

struct TapcountView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      TapcountView()
   }
}
