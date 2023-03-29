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
            VStack{
                Text(excercise.name)
                    .foregroundColor(Color.accent).font(.custom("HelveticaNeue-Thin", size: 30)).padding(.trailing).padding(.leading).padding(.top)
                HStack{
                    VStack{
                        Text("Reps:").foregroundColor(Color.accent).font(Constants.textFont).padding(.top)
            Text(String(excercise.reps))
                            .foregroundColor(Color.accent).font(.custom("HelveticaNeue-Thin", size: 25)).padding(.bottom).padding(.leading).padding(.trailing)
                        
                    }
                    VStack{
                        Text("Sets:").foregroundColor(Color.accent).font(Constants.textFont).padding(.top)
            Text(String(excercise.sets))
                        .foregroundColor(Color.accent).font(.custom("HelveticaNeue-Thin", size: 25)).padding(.bottom).padding(.leading).padding(.trailing)
                    }
                    VStack{
                        Text("Weight:").foregroundColor(Color.accent).font(Constants.textFont).padding(.top)
            Text(String(excercise.weight))
                        .foregroundColor(Color.accent).font(.custom("HelveticaNeue-Thin", size: 25)).padding(.bottom).padding(.leading).padding(.trailing)
                    }
                    
                    
                    
                       
                }
                
            }
            

        }.cornerRadius(20)
    }
}

struct ExcerciseDayView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseDayView(excercise: Binding.constant(Exercise()))
    }
}
