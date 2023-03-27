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
    
    @ObservedObject var workout: Workout
    @EnvironmentObject var userInfo: UserInfo
    
    
    var body: some View {
        ZStack {

                NavigationView{
                    ZStack{
                        Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.accent)
                        VStack{
                        List{
                    
                            ForEach(0..<workout.exercises.count, id: \.self) { index in
                        NavigationLink{
                            
                        }label:{
                            ExcerciseDayView(excercise: $workout.exercises[index])
                            
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
                            }.toolbar {
                                ToolbarItem(placement: .principal) {
                                    TextField("Title", text: $workout.name).font(Font.title.weight(.bold)).onSubmit {
                                        guard let uid = Auth.auth().currentUser?.uid else{return}
                                        
                                        let database = Database.database().reference().child("users/\(uid)")
                                        database.setValue(self.userInfo.dictionary)
                                    }
                                }
                              }
                        }.background(Color.accent)
                            
                            
                            Button{
                            guard let uid = Auth.auth().currentUser?.uid else{return}

                                workout.exercises.append(Exercise())

                            let database = Database.database().reference().child("users/\(uid)")
                            database.setValue(self.userInfo.dictionary)
                        }label: {
                            Text("Add Excercise").padding().background(Color.highlight).foregroundColor(Color.accent).cornerRadius(20)
                        }
                        }
                    }
                }
                
            //add workout
    
            
            
        }
    }

}

struct WorkoutOverView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutOverView(workout: Workout())
    }
}
