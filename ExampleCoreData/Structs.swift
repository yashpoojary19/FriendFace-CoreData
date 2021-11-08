//
//  Structs.swift
//  ExampleCoreData
//
//  Created by Yash Poojary on 08/11/21.
//

import Foundation

struct LoadedUser: Codable, Identifiable {
    var id: String?
    var name: String?
    var age: Int
    var company: String?
    var isActive: Bool
    var friends: [LoadedFriend]
}

struct LoadedFriend: Codable, Identifiable {
    var id: String?
    var name: String?
}
