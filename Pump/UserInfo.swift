//
//  UserInfo.swift
//  New Wave Store
//
//  Created by Ian Pulsifer (student LM) on 2/6/23.
//

import Foundation
import FirebaseAuth

class UserInfo: ObservableObject{
    @Published var username: String
    @Published var password: String
    @Published var loggedIn: Bool = false
    @Published var FirstName: String
    @Published var LastName: String
    @Published var FavTeam: String
    
    var dictionary: [String: Any]{
        return ["First Name": FirstName, "Last Name": LastName, "Favorite Team": FavTeam]
    }
    
    init(username: String = "", password: String = ""){
        self.username = username
        self.password = password
        self.FirstName = ""
        self.LastName = ""
        self.FavTeam = ""
        
        
        Auth.auth().addStateDidChangeListener { _, user in
            guard let user = user else {return}
            
            self.loggedIn.toggle()
            self.username = user.email ?? ""
        }
    }
}
