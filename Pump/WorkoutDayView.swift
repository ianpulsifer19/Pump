//
//  WorkoutDayView.swift
//  Pump
//
//  Created by Crosby Johnson (student LM) on 3/9/23.
//

import SwiftUI

struct WorkoutDayView: View {
    @Binding var workout: Workout
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.highlight)
            VStack {
                Spacer()
                Text(workout.name).foregroundColor(Color.accent).font(Constants.textFont).padding()
                
//                Button {
//                    //viewState = .editWorkout
//                } label: {
//                    Text("Edit Workout")
//                        .frame(width: 220, height: 50, alignment: .center)
//                        .background(Color.accent)
//                        .cornerRadius(20)
//
//                }
//                Button {
//                    //viewState = .startWorkout
//                } label: {
//                    Text("Start Workout")
//                        .frame(width: 220, height: 50, alignment: .center)
//                        .background(Color.accent)
//                        .cornerRadius(20)
//
//                }.padding()

            }

        }.cornerRadius(40)
    }
}

struct WorkoutDayView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDayView(workout: Binding.constant(Workout()))
    }
}
