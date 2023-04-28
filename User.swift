//
//  User.swift
//  MyMotivation
//
//  Created by Stephen Glunt on 4/27/23.
//

import Foundation

class appUser: ObservableObject {
    private var myCollections: Array<vidList>
    
    init(listCollection: [vidList]) {
        self.myCollections = listCollection.map { $0 }
    }
    
    func getLists() -> Array<vidList> {
        return self.myCollections
    }
}
