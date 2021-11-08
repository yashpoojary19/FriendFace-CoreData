//
//  UserView.swift
//  ExampleCoreData
//
//  Created by Yash Poojary on 08/11/21.
//

import SwiftUI

struct UserView: View {
    
    @State private var isShowingFriendList = false
    
    var user: User
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                Text(user.wrappedName)
            }
            
            Section(header: Text("Age")) {
                Text("\(user.wrappedAge)")
            }
            
            Section(header: Text("Company")) {
                Text(user.wrappedCompany)
            }
            
            Section(header: Text("Is Active")) {
                Text(user.checkIsActive)
            }
            
            Section(header: Text("Switch to show friends")) {
                Toggle(isOn: $isShowingFriendList) {
                    Text("Show \(user.wrappedName)'s friends")
                }
            }
            
            if isShowingFriendList {
                Section(header: Text("\(user.wrappedName)'s friends")) {
                    NavigationLink(destination: FriendsListView(friends: user.friendsArray)) {
                        Text("\(user.wrappedName)'s friends")
                    }
                }
            }
            
            
        }
    }
}

