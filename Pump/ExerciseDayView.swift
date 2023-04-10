//
//  ExcerciseDayView.swift
//  Pump
//
//  Created by Henry White (student LM) on 3/23/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct ExcerciseDayView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @Binding var name: String
    @Binding var sets: Int
    @Binding var reps: Int
    @Binding var weight: Int

    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.highlight)
            VStack{
                TextField("Excercise Name", text: $name).onSubmit {
                    guard let uid = Auth.auth().currentUser?.uid else{return}
                    
                    let database = Database.database().reference().child("users/\(uid)")
                    database.setValue(self.userInfo.dictionary)
                }
                    .foregroundColor(Color.accent).font(.custom("HelveticaNeue-Thin", size: 30)).padding(.trailing).padding(.leading).padding(.top).padding(.bottom, -10)
                HStack{
                    VStack{
                        Text("Reps:").foregroundColor(Color.accent).font(Constants.textFont).padding(.top)
                        TextField("Reps", value: $reps, format: .number).onSubmit {
                            guard let uid = Auth.auth().currentUser?.uid else{return}
                            
                            let database = Database.database().reference().child("users/\(uid)")
                            database.setValue(self.userInfo.dictionary)
                        }
                            .foregroundColor(Color.accent).font(.custom("HelveticaNeue-Thin", size: 25)).padding(.bottom).padding(.leading).padding(.trailing)
                        
                    }
                    VStack{
                        Text("Sets:").foregroundColor(Color.accent).font(Constants.textFont).padding(.top)
                        TextField("Sets", value: $sets, format: .number).onSubmit {
                            guard let uid = Auth.auth().currentUser?.uid else{return}
                            
                            let database = Database.database().reference().child("users/\(uid)")
                            database.setValue(self.userInfo.dictionary)
                        }
                        .foregroundColor(Color.accent).font(.custom("HelveticaNeue-Thin", size: 25)).padding(.bottom).padding(.leading).padding(.trailing)
                    }
                    VStack{
                        Text("Weight:").foregroundColor(Color.accent).font(Constants.textFont).padding(.top)
                        TextField("Weight", value: $weight, format: .number).onSubmit {
                            guard let uid = Auth.auth().currentUser?.uid else{return}
                            
                            let database = Database.database().reference().child("users/\(uid)")
                            database.setValue(self.userInfo.dictionary)
                        }
                        .foregroundColor(Color.accent).font(.custom("HelveticaNeue-Thin", size: 25)).padding(.bottom).padding(.leading).padding(.trailing)
                    }
                    
                    
                    
                       
                }
                
            }.multilineTextAlignment(.center)
            

        }.cornerRadius(20)
    }
}

struct ExcerciseDayView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseDayView(name: Binding.constant("Jawn"), sets: Binding.constant(0), reps: Binding.constant(0), weight: Binding.constant(0))
    }
}
