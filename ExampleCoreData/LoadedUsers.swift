//
//  LoadedUsers.swift
//  ExampleCoreData
//
//  Created by Yash Poojary on 08/11/21.
//

import Foundation
import CoreData

class Users {
    
    
    static func loadDataToCD(moc: NSManagedObjectContext) {
        loadDataFromJSON { (users) in
            
            DispatchQueue.main.async {
                
                var tempUsers = [User]()
                
                for user in users {
                    let newUser = User(context: moc)
                    
                    newUser.name = user.name
                    newUser.id = user.id
                    newUser.isActive = user.isActive
                    newUser.company = user.company
                    newUser.age = Int16(user.age)
                    tempUsers.append(newUser)
                }
                
                for index in 0..<users.count {
                    for friend in users[index].friends {
                        let newFriend = Friend(context: moc)
                        
                        newFriend.id = friend.id
                        newFriend.name = friend.name
                        
                        
                        tempUsers[index].addToFriends(newFriend)
                        
                    }
                }
            }
            
                try? moc.save()
        }
        
        
    }
    
    
    static func loadDataFromJSON(completion: @escaping ([LoadedUser]) -> ()) {

        
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                    print("There was an error")
                    return
                }
                
                let request = URLRequest(url: url)
                
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let userData = data {
                        
                        
                          let decoder = JSONDecoder()
                          decoder.dateDecodingStrategy = .iso8601
                    
                        
                        if let decodedUsers = try? decoder.decode([LoadedUser].self, from: userData) {
                                completion(decodedUsers)
                            
//                                users = decodedUsers

                        }
                        
                        
                    }
                    
                    print("Fetch Failed: \(error?.localizedDescription ?? "NA")")
                    
                    
                }.resume()
                
            
            
        
    }
}
