//
//  GroupService.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 09/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class GroupService {
    
    func loadGroupList(completion: (([FirebaseGroup]?, Error?) -> Void)? = nil ) {
        
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "user_id":Session.shared.userId,
            "extended":1,
            "fields": "photo_50",
            "v": "5.87"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON(queue: DispatchQueue.global()) { (response) in
            
            switch response.result {
            case .failure(let error):
                completion?(nil, error)
                
            case .success(let value):
                let json = JSON(value)
                
                
                var GroupsArray = [FirebaseGroup]()
                _ = json["response"]["items"].arrayValue.map {
                    
                    let id = $0["id"].intValue
                    let name = $0["name"].stringValue
                    let photoUrl = $0["photo_50"].stringValue
                    
                    let NewGroup = FirebaseGroup(name: name, idGroup: id, photoUrl: photoUrl)
                    GroupsArray.append(NewGroup)
                }
                
                
                completion?(GroupsArray, nil)
            }
        }
    }
    
    func loadGroupInfo(for group: String, completion: (([GroupPost]?, Error?) -> Void)? = nil ) {
        
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/groups.getById"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "user_id":Session.shared.userId,
            "group_id":group,
            "fields": "photo_200,description",
            "v": "5.87"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON(queue: DispatchQueue.global()) { (response) in
            
            switch response.result {
            case .failure(let error):
                completion?(nil, error)
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                let groups = json["response"].arrayValue.map { GroupPost(json: $0) }
                
                completion?(groups, nil)
            }
        }
    }
    
}
