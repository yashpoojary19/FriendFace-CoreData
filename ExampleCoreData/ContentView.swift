//
//  ContentView.swift
//  ExampleCoreData
//
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var users: FetchedResults<User>

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: UserView(user: user)) {
                        HStack {
                            Text("\(user.checkIsActive)")
                            VStack(alignment: .leading) {
                                Text(user.wrappedName)
                                    .font(.headline)
                                Text("Age: \(user.wrappedAge)")
                            }
                        }
                    }
                }
                .onDelete(perform: remove)
            }
            .navigationTitle("FriendFace")
            
        }
        .onAppear {
            if users.isEmpty {
                print("Users is empty \(self.users)")
                Users.loadDataToCD(moc: moc)
            }
        }
       
    }
    
    func remove(at offsets: IndexSet) {
        for index in offsets {
            let user = users[index]
            moc.delete(user)
        }
        
        try? moc.save()
    }
    
//    for all in users {
//        moc.delete(all)
//    }
//    
//    try? moc.save

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
