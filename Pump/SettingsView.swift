//
//  SettingsView.swift
//  New Wave Store
//
//  Created by Ian Pulsifer (student LM) on 2/7/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct SettingsView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Image("Max_Keefe")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                TextField("First Name", text: $userInfo.FirstName).font(Constants.buttonFont).padding(.leading).onSubmit {
                    guard let uid = Auth.auth().currentUser?.uid else{return}
                    
                    let database = Database.database().reference().child("users/\(uid)")
                    database.setValue(self.userInfo.dictionary)
                }.padding().background(Color.white)
                
                Spacer()
                
                TextField("Last Name", text: $userInfo.LastName).font(Constants.buttonFont).padding(.leading).onSubmit{
                    guard let uid = Auth.auth().currentUser?.uid else{return}
                    
                    let database = Database.database().reference().child("users/\(uid)")
                    database.setValue(self.userInfo.dictionary)
                }.padding().background(Color.white)
                
                Spacer()
                
                TextField("Favorite Team", text: $userInfo.FavTeam).font(Constants.buttonFont).padding(.leading).onSubmit {
                    guard let uid = Auth.auth().currentUser?.uid else{return}
                    
                    let database = Database.database().reference().child("users/\(uid)")
                    database.setValue(self.userInfo.dictionary)
                }.padding().background(Color.white)
                
                Spacer()
                
                Button{
                    try! Auth.auth().signOut()
                    userInfo.username = ""
                    userInfo.password = ""
                    userInfo.loggedIn = false
                    viewState = .authenticate
                } label:{
                    Text("Sign Out").frame(width: 220, height: 50, alignment: .center).font(Constants.buttonFont)
                }.background(Color.white).cornerRadius(200).padding()
            }.padding(.leading).padding(.trailing)
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(.list))
    }
}
