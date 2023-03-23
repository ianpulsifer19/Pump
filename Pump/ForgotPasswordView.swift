//
//  ForgotPasswordView.swift
//  New Wave Store
//
//  Created by Ian Pulsifer (student LM) on 2/6/23.
//

import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    @EnvironmentObject var userInfo: UserInfo
    @Binding var viewState: ViewState
    
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.accent)
            VStack {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 300)
                Spacer()
               
                VStack{
                    TextField("Email Address", text: $userInfo.username)
                }.padding().background(Color.accent).padding().background(Color.highlight).cornerRadius(12).padding().font(Constants.textFont)
                
                Button{
                    Auth.auth().sendPasswordReset(withEmail: userInfo.username) { error in
                        if let error = error {
                            print(error.localizedDescription)
                        }else{
                            viewState = .authenticate}
                    }
                } label:{
                    Text("Forgot Password").frame(width: 220, height: 50, alignment: .center).font(Constants.buttonFont)
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

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(viewState: Binding.constant(.forgotpassword))
    }
}
