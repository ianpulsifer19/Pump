
//  NotesView.swift
//  Pump
//
//  Created by Max Keefe (student LM) on 3/8/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase



struct NotesView: View {
   
    @EnvironmentalObject var userInfo : UserInfo
  
    var body: some View {
       
        Text("\($userInfo.workout.exercise.name)")
        Text("\($userInfo.workout.exercise.details)")
        
    }
struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
}



