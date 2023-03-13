//
//  WorkoutOverView.swift
//  
//
//  Created by Crosby Johnson (student LM) on 3/6/23.
//

import SwiftUI

struct WorkoutOverView: View {
    @Binding var exercise: Exercise
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.accent)
                .cornerRadius(10)
                .frame(width: 200, height: 100)
                .padding()
        VStack{
            Text("\(exercise.name)")
            Text("Sets - \(exercise.sets)")
            Text("Reps - \(exercise.reps)")
            Text("Weight - \(exercise.weight)lbs")
        }.foregroundColor(Color.highlight)
            
        }
    }
}

struct WorkoutOverView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutOverView(exercise: Binding.constant(Exercise()))
    }
}
