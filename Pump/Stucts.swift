//
//  Structs.swift
//  Pump
//
//  Created by Ian Pulsifer (student LM) on 3/13/23.
//

import Foundation

struct workout: Identifiable {
    var name: String
    var exercises: [exercise]
    var id: String
}

struct exercise: Identifiable {
    var name: String
    var sets: Int
    var reps: Int
    var weight: Int
    var id = UUID()
}
