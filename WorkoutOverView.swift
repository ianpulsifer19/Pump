//
//  MainView.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 3/3/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct WorkoutOverView: View {
    @Binding var workout: Workout
    @EnvironmentObject var userInfo: UserInfo
    
    
    var body: some View {
        ZStack {

            VStack{
                
                NavigationView{
                    ZStack{
                        Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.accent)
                        VStack{
                        List{
                    
                            ForEach(0..<workout.exercises.count, id: \.self) { index in
                        NavigationLink{
                            
                        }label:{
                            ExerciseDayView(workout: $workout.exercises[index])
                            
                        }.swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                workout.exercises.remove(at: index)
                                
                                guard let uid = Auth.auth().currentUser?.uid else{return}
                                let database = Database.database().reference().child("users/\(uid)")
                                database.setValue(self.userInfo.dictionary)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }.listRowBackground(Color.accent)
                    }.navigationTitle("Workouts")
                        }.background(Color.accent)
                            
                            Button{
                            guard let uid = Auth.auth().currentUser?.uid else{return}

                            workout.append(Exercise())

                            let database = Database.database().reference().child("users/\(uid)")
                            database.setValue(self.userInfo.dictionary)
                        }label: {
                            Text("Add workout").padding().background(Color.highlight).foregroundColor(Color.accent).cornerRadius(20)
                    }
                        }
                    }
                }
                
            //add workout
    
            
                
            }
        }.onAppear{
            UITableView.appearance().backgroundColor = .clear
        }
    }

}

struct WorkoutOverView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutOverView()
    }
}
