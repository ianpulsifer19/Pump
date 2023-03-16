//
//  ContentView.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 1/19/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    //@StateObject var fetchData = FetchData()
    @EnvironmentObject var userInfo: UserInfo
    @State var viewState: ViewState = .authenticate
    
    var body: some View {
        if viewState == .authenticate && !userInfo.loggedIn{
                AuthenticationView(viewState: $viewState)
            }
        else if viewState == .login && !userInfo.loggedIn{
                    LogInView(viewState: $viewState)
                }
        else if viewState == .signup && !userInfo.loggedIn{
                    SignUpView(viewState: $viewState)
                }
        else if viewState == .forgotpassword && !userInfo.loggedIn{
                    ForgotPasswordView(viewState: $viewState)
                }
        else{
        
            TabView{
                MainView().tabItem {
                    Image(systemName: "")
                    Text("Home")
                }
                SettingsView(viewState: $viewState).tabItem{
                    Image(systemName: "")
                    Text("Settings")
                }
            
            }
    }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
