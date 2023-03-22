//
//  Workout.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 3/6/23.
//

import Foundation

class Workout {
    @Published var name: String
    @Published var exercises: [Exercise]
    
    var dictionary: [String: Any]{
        
        var works = [[String: Any]]()
        for w in exercises{
            works.append(w.dictionary)
        }
        
        return ["Name": name, "Exercises": works]
    }
    
    init(name: String = "No Name", exercises: [Exercise] = [Exercise(), Exercise()]){
        self.name = name
        self.exercises = exercises
    }
}
