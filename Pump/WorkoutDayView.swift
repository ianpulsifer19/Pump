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
                Text(workout.name).foregroundColor(Color.accent).font(Constants.textFont).padding()
            }

        }.cornerRadius(40)
    }
}

struct WorkoutDayView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDayView(workout: Binding.constant(Workout()))
    }
}
