//import Foundation
//import FirebaseDatabase
//import FirebaseAuth
//
//final class FetchData: ObservableObject {
//    @Published var workouts: [Workout] = []
//
//    private lazy var databasePath: DatabaseReference? = {
//        let ref = Database.database().reference().child("users/\(Auth.auth().currentUser!.uid)")
//        return ref
//    }()
//
//    private let encoder = JSONEncoder()
//    private let decoder = JSONDecoder()
//
//    func listentoRealtimeDatabase() {
//        guard let databasePath = databasePath else {
//            return
//        }
//        databasePath
//            .observe(.childAdded) { [weak self] snapshot in
//                guard
//                    let self = self,
//                    var json = snapshot.value as? [String: Any]
//                else {
//                    return
//                }
//                json["id"] = snapshot.key
//                do {
//                    let workoutData = try JSONSerialization.data(withJSONObject: json)
//                    let w = try self.decoder.decode(Workout.self, from: workoutData)
//                    self.workouts.append(w)
//                    print(self.workouts)
//                } catch {
//                    print("an error occurred", error)
//                }
//            }
//    }
//
//    func stopListening() {
//        databasePath?.removeAllObservers()
//    }
//}
