//
//  ExcerciseDayView.swift
//  Pump
//
//  Created by Henry White (student LM) on 3/23/23.
//

import SwiftUI

struct ExcerciseDayView: View {
    @Binding var excercise: Exercise

    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.highlight)
            VStack {
                HStack{
            Text(excercise.name)
                        .foregroundColor(Color.accent).font(Constants.textFont).padding()
                        
            Text(String(excercise.reps))
                        .foregroundColor(Color.accent).font(Constants.textFont).padding()
            Text(String(excercise.sets))
                        .foregroundColor(Color.accent).font(Constants.textFont).padding()
            Text(String(excercise.weight))
                        .foregroundColor(Color.accent).font(Constants.textFont).padding()
                    
                    
                    
                       
                }
            }

        }.cornerRadius(40)
    }
}

struct ExcerciseDayView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseDayView(excercise: Binding.constant(Exercise()))
    }
}
