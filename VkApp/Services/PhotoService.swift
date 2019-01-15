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

class PhotoService {
    
    func loadPhotoProfile(userId:String,completion: (([PhotoRealm]?, Error?) -> Void)? = nil ) {
        
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/photos.getUserPhotos"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "user_id":Session.shared.userId,
            "owner_id":userId,
            "album_id":"profile",
            "count":"1",
            "v": "5.92"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON(queue: DispatchQueue.global()) { (response) in
            
            switch response.result {
            case .failure(let error):
                print(error)
                completion?(nil, error)
                
            case .success(let value):
                let json = JSON(value)
                
                
                var PhotosArray = [PhotoRealm]()
                _ = json["response"]["items"].arrayValue.map {
                    
                    let id = Int(userId)!
                    let sizes = $0["sizes"].arrayValue
                    for i in sizes{
                        if i["type"] == "x"{
                            let photoUrl = i["url"].stringValue
                            let NewPhoto = PhotoRealm(id: id, photoUrl: photoUrl)
                            
                            PhotosArray.append(NewPhoto)
                        }
                    }
                }
                DatabaseService.saveToRealm(items: PhotosArray, config: DatabaseService.configuration, update: true)
                
                completion?(PhotosArray, nil)
            }
        }
    }

    
}
