//
//  MainView.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 3/3/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct MainView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        ZStack {
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.highlight)
            VStack{
                
                
            //add workout
                Button{
                guard let uid = Auth.auth().currentUser?.uid else{return}
                
                userInfo.workouts.append(Workout())
                
                let database = Database.database().reference().child("users/\(uid)")
                database.setValue(self.userInfo.dictionary)
            }label: {
                Text("Add workout").padding().background(Color.accent).foregroundColor(Color.highlight).cornerRadius(20)
        }
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
