//
//  DetailView.swift
//  ExampleCoreData
//
//  Created by Yash Poojary on 08/11/21.
//

import SwiftUI

struct DetailView: View {
    
    var fetchRequest: FetchRequest<User>
    
    var user: User? {
        fetchRequest.wrappedValue.first
    }
    
    
    var body: some View {
            UserView(user: user!)
    }
    
    init(userID: String) {
        fetchRequest = FetchRequest<User>(entity: User.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id == %@", userID))
    }
}




//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
