import Foundation
import FirebaseDatabase
import FirebaseAuth

final class FetchData: ObservableObject {
    
    @Published var Workouts: workouts = workouts()
    
    func getData() async{
        let URLString = "https://pump-pump19-default-rtdb.firebaseio.com/users/\(Auth.auth().currentUser!.uid).json"
        
        guard let url = URL(string: URLString) else {return}
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let workouts = try JSONDecoder().decode(workouts.self, from: data)
            self.Workouts = workouts
            print()
            print(Workouts.uid)
            print()
        }catch{
            print(error)
        }
    }
}

struct workouts: Codable {
    var workouts: [workout] = [workout]()
    var uid: String = "poopman"
}

struct workout: Codable {
    var Name: String = "Monday"
    var Exercises: [exercise] = [exercise()]
}

struct exercise: Codable {
    var Name: String = "Curls"
    var Sets: Int = 0
    var Reps: Int = 0
    var Weight: Int = 0
}

