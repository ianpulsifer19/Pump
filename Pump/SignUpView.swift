//
//  SignUpView.swift
//  New Wave Store
//
//  Created by Ian Pulsifer (student LM) on 2/1/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.accent)
            VStack {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
                Spacer()
               
                VStack{
                    TextField("Email Address", text: $userInfo.username).padding(.bottom)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $userInfo.password).padding(.bottom)
                        .disableAutocorrection(true)
                    SecureField("Confirm Password", text: $userInfo.password)
                        .disableAutocorrection(true)
                }.padding().background(Color.accent).padding().background(Color.highlight).cornerRadius(12).padding().font(Constants.textFont)
                
                Button{
                    Auth.auth().createUser(withEmail: userInfo.username, password: userInfo.password){ user, error  in
                        if let _ = user{
                            print("success")
                            viewState = .list
                        } else {
                            print(error!.localizedDescription)
                        }
                    }
                } label:{
                    Text("Sign Up").frame(width: 220, height: 50, alignment: .center).font(Constants.buttonFont)
                }.background(Color.highlight).cornerRadius(200).padding().foregroundColor(.accent)
                Button{
                    viewState = .authenticate
                } label:{
                    Text("Back").frame(width: 220, height: 50, alignment: .center).font(Constants.buttonFont)
                }.background(Color.highlight).cornerRadius(200).foregroundColor(.accent)

                

                
                Spacer()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewState: Binding.constant(.signup))
    }
}
