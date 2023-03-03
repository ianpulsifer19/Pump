//
//  AuthenticationView.swift
//  New Wave Store
//
//  Created by Ian Pulsifer (student LM) on 2/1/23.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var viewState: ViewState
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.highlight)
            VStack {
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 300)
                Spacer()
                
                Button{
                    viewState = .login
                } label:{
                    Text("Log In").frame(width: 220, height: 50, alignment: .center).font(Constants.buttonFont)
                }.background(Color.white).cornerRadius(200).padding([.top, .leading, .trailing])

                
                Button{
                    viewState = .signup
                } label:{
                    Text("Sign Up").frame(width: 220, height: 50, alignment: .center).font(Constants.buttonFont)
                }.background(Color.white).cornerRadius(200).padding([.leading, .bottom, .trailing])
                
                Spacer()
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(viewState: Binding.constant(.authenticate))
    }
}
