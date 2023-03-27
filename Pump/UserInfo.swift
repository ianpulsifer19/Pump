//
//  UserInfo.swift
//  New Wave Store
//
//  Created by Ian Pulsifer (student LM) on 2/6/23.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import Firebase




class UserInfo: ObservableObject{
    @Published var username: String
    @Published var password: String
    @Published var loggedIn: Bool = false
    @Published var FirstName: String
    @Published var LastName: String
    @Published var FavTeam: String
    @Published var workouts = [Workout()]
    
//
//    func getData(){
//        var ref = Database.database().reference()
//
//        ref.child("user/\(Auth.auth().currentUser?.uid)").getData { error, snapshot in
//            print(snapshot)
//        }
//
//
//    }
//
//    func getData(){
//        let db = Firestore.firestore()
//
//        db.collection("/users/\(Auth.auth().currentUser?.uid)").getDocuments { snapshot, error in
//
//            if error == nil{
//
//                if let snapshot = snapshot {
//
//                    DispatchQueue.main.async {
//
//                    self.workouts = snapshot.documents.map { d in
//                        return workout(name: d["name"] as? String ?? "",
//                                       exercises: d["exercises"] as? [exercise] ?? [],
//                                       id: d.documentID)
//                    }
//                    }
//                }
//
//            }
//            else{
//
//            }
//
//        }
//    }
    
    var dictionary: [String: Any]{
        var ws: [String: Any] = [:]
        ws["uid"] = username
        var works = [[String: Any]]()
        
        // create a list of [[String: Any]]()
        for w in workouts{
            works.append(w.dictionary)
        }
        
        ws["workouts"] = works
        return ws
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
