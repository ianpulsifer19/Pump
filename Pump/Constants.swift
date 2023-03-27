//
//  Constants.swift
//  Calculator
//
//  Created by Ian Pulsifer (student LM) on 10/20/22.
//
import SwiftUI

extension Color{
    static let background = Color("background")
}

enum ViewState{
    case list
    case authenticate
    case signup
    case login
    case forgotpassword
    case editworkout
    case workout
    case isLoading
}

struct Constants{
    static let buttonFont : Font = Font(UIFont(name: "HelveticaNeue-Thin", size: 16) ?? UIFont.systemFont(ofSize: 16))
    static let textFont : Font = Font(UIFont(name: "HelveticaNeue-Thin", size: 20) ?? UIFont.systemFont(ofSize: 20))
}

extension Color{
    static let highlight = Color("Highlight")
}

extension Color{
    static let accent = Color("Accent")
}
