//
//  ContentView.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 1/19/23.
//

import SwiftUI
import FirebaseAuth
import CoreMIDI


struct ContentView: View {
    
    @StateObject var fetchdata = FetchData()
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
                ZStack{
                    if viewState == .isLoading{
                        ZStack{
                        Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.accent)
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.highlight))
                    }
                    } else{
                MainView()
                    }
                }.task{
                    if viewState != .authenticate || userInfo.loggedIn{
                    viewState = .isLoading
                    await fetchdata.getData()
                        viewState = .list}
                    userInfo.workouts = []
                    for w in fetchdata.Workouts.workouts.indices {
                        userInfo.workouts.append(Workout(name: fetchdata.Workouts.workouts[w].Name, exercises: []))
                        for e in fetchdata.Workouts.workouts[w].Exercises {
                            userInfo.workouts[w].exercises.append(Exercise(name: e.Name, sets: e.Sets, reps: e.Reps, weight: e.Weight))
                        }
                    }
                      
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.background(Color.accent)
                SettingsView(viewState: $viewState).tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }.background(Color.accent)
            
            }.background(Color.accent)
    }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
