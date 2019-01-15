//
//  NewsService.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 07/01/2019.
//  Copyright © 2019 AVSI. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class NewsService {


    func loadNewsList(completion: (([NewsClass]?, Error?) -> Void)? = nil ) {
        
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/newsfeed.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "user_id":Session.shared.userId,
            "filters": "post",
            "count":"50",
            "v": "5.92"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON(queue: DispatchQueue.global()) { (response) in
            
            switch response.result {
            case .failure(let error):
                completion?( nil,error)
                
            case .success(let value):
                //print(value)
                var NewsArray = [NewsClass]()
                let json = JSON(value)
                
                _ = json["response"]["items"].arrayValue.map {
                    
                    let likes = $0["likes"]["count"].intValue
                    let comments = $0["comments"]["count"].intValue
                    let reposts = $0["reposts"]["count"].intValue
                    let text = $0["text"].stringValue
                    
                    var photoUrl:String!
                    
                    _ =  $0["attachments"].arrayValue.map {
                        
                        let sizes = $0["photo"]["sizes"].arrayValue
                        print(sizes)
                        for i in sizes{
                            if i["type"] == "m"{
                                photoUrl = i["url"].stringValue
                            }
                        }
                    }
                    let namePub = $0["source_id"].intValue
                    
                    _ = json["response"]["groups"].arrayValue.map {
                        
                        let name = $0["name"].stringValue
                        let photo = $0["photo_100"].stringValue
                        let idGroup = $0["id"].intValue
                        if idGroup == abs(namePub){
                            if photoUrl == nil{
                                photoUrl = ""
                            }
                            let NewNews = NewsClass(name: name , likes: likes, repost: reposts, Comment: comments, avaphoto: photo, text: text, photoWall: photoUrl)
                            NewsArray.append(NewNews)
                        }
                    }
                }
                completion?(NewsArray, nil)
            }
        }
    }

}
