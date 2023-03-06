//
//  WorkoutDetailView.swift
//  Pump
//
//  Created by Crosby Johnson (student LM) on 3/3/23.
//

import SwiftUI

struct WorkoutDetailView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .background(Color.blue)
            VStack {
                Spacer()
                HStack{
                    Text("exercise | Sets: sets | Reps: reps")
                }
                Button {
                    //viewState = editWorkout
                } label: {
                    Text("Edit Workout")
                        .frame(width: 220, height: 50, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                        
                }.padding()
                Button {
                    //viewState = startWorkout
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