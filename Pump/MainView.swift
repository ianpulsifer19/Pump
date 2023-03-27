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
    @StateObject var fetchdata = FetchData()
    @State var num = 5
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {

            VStack{
                
                NavigationView{
                    ZStack{
                        Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(.accent)
                        VStack{
                        List{
                    
                    ForEach(0..<userInfo.workouts.count, id: \.self) { index in
                        NavigationLink{
                            WorkoutOverView(workout: userInfo.workouts[index])
                        }label:{
                            WorkoutDayView(workout: $userInfo.workouts[index])
                        }.swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                userInfo.workouts.remove(at: index)
                                
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

                            userInfo.workouts.append(Workout())

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
        }
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
