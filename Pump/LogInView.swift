//
//  LogInView.swift
//  New Wave Store
//
//  Created by Ian Pulsifer (student LM) on 2/1/23.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {

    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.highlight)
            VStack {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
                Spacer()
               
                VStack{
                    TextField("Email Address", text: $userInfo.username).padding(.bottom)
                    SecureField("Password", text: $userInfo.password)
                }.font(Constants.textFont).padding().cornerRadius(30).background(Color.white)
                
                Button{
                    Auth.auth().signIn(withEmail: userInfo.username, password: userInfo.password){ user, error  in
                        if let _ = user{
                            viewState = .list
                        } else {
                            print(error?.localizedDescription)
                        }
                    }
                } label:{
                    Text("Log In").frame(width: 220, height: 50, alignment: .center).font(Constants.buttonFont)
                }.background(Color.white).cornerRadius(200).padding()
                Button{
                    viewState = .forgotpassword
                } label:{
                    Text("Forgot Password").frame(width: 220, height: 50, alignment: .center).font(Constants.buttonFont)
                }.background(Color.white).cornerRadius(200).padding()
                Button{
                    viewState = .authenticate
                } label:{
                    Text("Back").frame(width: 220, height: 50, alignment: .center).font(Constants.buttonFont)
                }.background(Color.white).cornerRadius(200)

                

                
                Spacer()
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(viewState: Binding.constant(.login))
    }
}
