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
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.highlight)
            VStack {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 200)
                Spacer()
               
                VStack{
                    TextField("Email Address", text: $userInfo.username).padding(.bottom)
                }.font(Constants.textFont).padding().cornerRadius(30).background(Color.white)
                
                Button{
                    Auth.auth().sendPasswordReset(withEmail: userInfo.username) { error in
                        if let error = error {
                            print(error.localizedDescription)
                        }else{
                            viewState = .authenticate}
                    }
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

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(viewState: Binding.constant(.forgotpassword))
    }
}
