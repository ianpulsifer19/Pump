//
//  ExerciseDetailView.swift
//  Pump
//
//  Created by Crosby Johnson (student LM) on 3/22/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    @Binding var exercise : Exercise
    var body: some View {
        ZStack {

            VStack{
                Text("Sets:")
                TextField("", value: $exercise.sets, formatter: NumberFormatter())
                    .padding([.bottom])
                Text("Reps:")
                TextField("", value: $exercise.reps, formatter: NumberFormatter())
                    .padding([.bottom])
            }.navigationTitle(exercise.name)

        }
}
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: Binding.constant(Exercise()))
    }
}
