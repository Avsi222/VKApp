//
//  UserService.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 09/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class UserService {
    
    func loadUser(for user: String, completion: (([UserRealm]?, Error?) -> Void)? = nil ) {
        
        // Weather forecast parameters
        // q - search city name
        // ...
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/users.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "fields": "photo_max_orig,bdate,about",
            "user_ids":user,
            "v": "5.87"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON(queue: DispatchQueue.global()) { (response) in
            
            switch response.result {
            case .failure(let error):
                completion?(nil, error)
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                var Person = [UserRealm]()
                _ = json["response"].arrayValue.map {
                    
                    let id = $0["id"].intValue
                    let firstName = $0["first_name"].stringValue
                    let lastName = $0["last_name"].stringValue
                    let photoUrl = $0["photo_max_orig"].stringValue
                    let age = $0["bdate"].stringValue
                    let about = $0["about"].stringValue
                    
                    let NewUser = UserRealm(id: id, firstName: firstName, lastName: lastName, photoUrl: photoUrl, age: age, about: about)
                    
                    Person.append(NewUser)
                }
                
                completion?(Person, nil)
            }
        }
    }

    
}
