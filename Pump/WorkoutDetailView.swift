//
//  WorkoutDetailView.swift
//  Pump
//
//  Created by Crosby Johnson (student LM) on 3/3/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct WorkoutDetailView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.highlight)
            VStack {
//                VStack{
//                    TextField("Exercise Name", text: $userInfo.workouts[0].exercises[0].name).font(Constants.buttonFont).padding(.leading).onSubmit {
//                        guard let uid = Auth.auth().currentUser?.uid else{return}
//
//                        let database = Database.database().reference().child("users/\(uid)")
//                        database.setValue(self.userInfo.dictionary)
//                    }
//                }.foregroundColor(Color.accent).font(Constants.textFont)
                Button {
                    //viewState = .editWorkout
                } label: {
                    Text("Edit Workout")
                        .frame(width: 220, height: 50, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                        
                }.padding()
                Button {
                    //viewState = .startWorkout
                } label: {
                    Text("Start Workout")
                        .frame(width: 220, height: 50, alignment: .center)
                        .background(Color.green)
                        .cornerRadius(20)
                        
                }.padding()

            }

            }
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView()
    }
}
