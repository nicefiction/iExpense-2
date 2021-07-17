//  UserView.swift

import SwiftUI



struct UserView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @ObservedObject var user: User = User()
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         Group {
            Text("Your name is :")
            Text("\(user.firstName) \(user.lastName)")
               .font(.title)
               .fontWeight(.semibold)
         }
         .multilineTextAlignment(.center)
         Group {
            TextField("Firstname" ,
                      text: $user.firstName)
            TextField("Lastname" ,
                      text: $user.lastName)
         }
         .textFieldStyle(RoundedBorderTextFieldStyle())
         .padding()
      }
   }
}




// MARK: - PREVIEWS -

struct UserView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      UserView()
   }
}



