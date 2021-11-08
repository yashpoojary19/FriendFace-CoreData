//
//  Friend+CoreDataProperties.swift
//  ExampleCoreData
//
//  Created by Yash Poojary on 08/11/21.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var user: User?
    
    public var wrappedId: String {
        id ?? "Unknown ID"
    }

    public var wrappedName: String {
        name ?? "Unkown Name"
    }

}

extension Friend : Identifiable {

}
