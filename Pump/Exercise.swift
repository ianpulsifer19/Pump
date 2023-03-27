//
//  Exercise.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 3/6/23.
//

import Foundation

class Exercise: ObservableObject {
    @Published var name: String
    @Published var sets: Int
    @Published var reps: Int
    @Published var weight: Int
    
    var dictionary: [String: Any]{
        return ["Name": name, "Sets": sets, "Reps": reps, "Weight": weight]
    }
    
    init(name: String = "Curls", sets: Int = 3, reps: Int = 10, weight: Int = 30){
        self.name = name
        self.sets = sets
        self.reps = reps
        self.weight = weight
    }
}
