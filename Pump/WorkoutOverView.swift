//
//  WorkoutOverView.swift
//  Pump
//
//  Created by Crosby Johnson (student LM) on 3/6/23.
//

import SwiftUI

struct WorkoutOverView: View {
    var body: some View {
            Rectangle()
                .foregroundColor(Color.blue)
                .cornerRadius(10)
                .frame(width: 200, height: 100)
                .padding()
        VStack{
            Text("")
            Text("Sets - \(exercise.sets)")
            Text("Reps - \(exercise.reps)")
            Text("Weight - \(exercise.weight)lbs")
        }
    }
}

struct WorkoutOverView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutOverView()
    }
}
