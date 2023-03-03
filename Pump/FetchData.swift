//
// WeeklyData.swift
//  Weather
//
//  Created by Ian Pulsifer (student LM) on 1/6/23.
//

import Foundation

class FetchData: ObservableObject{
    
    @Published var response: Response = Response()
    
    func getData() async{
        let URLString = "https://api.sportsdata.io/v3/nfl/scores/json/Rookies/2020?key=ad474be5313f49a69d7a0d2be3203075"
        
        guard let url = URL(string: URLString) else {return}
        
        do{
            print("data")
            let (data, _) = try await URLSession.shared.data(from: url)
            var stringResults = String(data: data, encoding: .utf8)
            stringResults = stringResults?.replacingOccurrences(of: "[", with: "{\"players\":[")
            stringResults = stringResults?.replacingOccurrences(of: "]", with: "]}")
//            let index = stringResults?.index(stringResults!.startIndex, offsetBy: 200)
//            print(stringResults![..<index!])
            let d = stringResults?.data(using: .utf8)
            
            let response = try JSONDecoder().decode(Response.self, from: d!)
        
            self.response = response
            print(self.response.players[0].Name)
            
            self.response.players = Array(self.response.players[0..<32])
        }catch{
            print(error)
        }
    }
}

struct Response: Codable{
    var players: [Player] = []
}

struct Player: Codable{
    var Team: String? = "JAX"
    var Name: String = "Travon Walker"
    var Position: String = "OLB"
    var College: String = "Georgia"
    var PhotoUrl: String = "https://s3-us-west-2.amazonaws.com/static.fantasydata.com/headshots/nfl/low-res/23316.png"
}

extension Player: Identifiable{
    var id: String {return Name}
}
