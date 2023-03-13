//
//  Workout.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 3/6/23.
//

import Foundation

class Workout: Identifiable {
    @Published var name: String
    @Published var exercises: [Exercise]
    @Published var id = UUID()
    
    var dictionary: [String: Any]{
        var ws: [String: Any] = [:]
        for w in exercises{
            ws[w.id.uuidString] = w.dictionary
        }
        
        return ["Name": name, "Exercises": ws]
    }
    
    init(name: String = "No Name", exercises: [Exercise] = [Exercise(), Exercise()]){
        self.name = name
        self.exercises = exercises
    }
}
