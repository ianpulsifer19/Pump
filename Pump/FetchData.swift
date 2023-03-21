import Foundation
import FirebaseDatabase
import FirebaseAuth

final class FetchData: ObservableObject {
    
    @Published var Workouts: workouts = workouts()
    
    func getData() async{
        let URLString = "https://pump-pump19-default-rtdb.firebaseio.com/users/\(Auth.auth().currentUser?.uid).json"
        
        guard let url = URL(string: URLString) else {return}
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let workouts = try JSONDecoder().decode(workouts.self, from: data)
            self.Workouts = workouts
            print(Workouts)
        }catch{
            print(error)
        }
    }
}

struct workouts: Codable {
    var workouts: [workout] = [workout]()
}

struct workout: Identifiable, Codable {
    var name: String = "Monday"
    var exercises: [exercise]
    var id: String
}

struct exercise: Identifiable, Codable {
    var name: String = "Curls"
    var sets: Int = 0
    var reps: Int = 0
    var weight: Int = 0
    var id: String
}

