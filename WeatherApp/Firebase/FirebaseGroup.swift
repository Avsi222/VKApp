//
//  FirebaseGroup.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 01/12/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import Firebase
import FirebaseDatabase

class FirebaseGroup {
    
    let name: String
    let idGroup: Int
    let photoUrl: String
    
    let ref: DatabaseReference?
    
    
    init(name: String, idGroup: Int,photoUrl:String) {
        self.ref = nil
        self.name = name
        self.idGroup = idGroup
        self.photoUrl = photoUrl
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: Any],
            let photoUrl = value["photoUrl"] as? String,
            let idGroup = value["idGroup"] as? Int,
            let name = value["name"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.idGroup = idGroup
        self.photoUrl = photoUrl
    }
    
    func toAnyObject() -> [String: Any] {
        return [
            "name": name,
            "idGroup": idGroup,
            "photoUrl": photoUrl
        ]
    }
}
