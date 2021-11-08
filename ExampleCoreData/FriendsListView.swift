//
//  FriendsListView.swift
//  ExampleCoreData
//
//  Created by Yash Poojary on 08/11/21.
//

import SwiftUI

struct FriendsListView: View {
    var friends: [Friend]
    
    
    var body: some View {
        List {
            ForEach(friends, id: \.wrappedId) { friend in
                NavigationLink(destination: DetailView(userID: friend.wrappedId)) {
                    VStack(alignment: .leading) {
                        Text(friend.wrappedName)
                    }
                }
            }
        }
    }
}
