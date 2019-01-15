//
//  FriendService.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 09/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//


import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON

class FriendService {
    
    func loadFriendsList(completion: (([FriendsRealm]?, Error?) -> Void)? = nil ) {
        
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "user_id":Session.shared.userId,
            "fields": "photo_100",
            "v": "5.87"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON(queue: DispatchQueue.global()) { (response) in
            
            switch response.result {
            case .failure(let error):
                completion?(nil, error)
                
            case .success(let value):
                let json = JSON(value)
                var PersonsArray = [FriendsRealm]()
                _ = json["response"]["items"].arrayValue.map {
                    
                    
                    let id = $0["id"].intValue
                    let firstName = $0["first_name"].stringValue
                    let lastName = $0["last_name"].stringValue
                    let photoUrl = $0["photo_100"].stringValue
                    
                    let NewPerson = FriendsRealm(id: id, firstName: firstName, lastName: lastName, photoUrl: photoUrl)
                    PersonsArray.append(NewPerson)
                }
                
                DatabaseService.saveToRealm(items: PersonsArray, config: DatabaseService.configuration, update: true)
                
                
                completion?(PersonsArray, nil)
            }
        }
    }
    
    
}
