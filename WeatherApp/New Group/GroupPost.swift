//
//  GroupPost.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 20/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import SwiftyJSON


class GroupPost {
    
    var id:Int!
    var name:String!
    var desctiption:String!
    var UrlForPhoto:String!
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.desctiption = json["description"].stringValue
        self.UrlForPhoto = json["photo_200"].stringValue
    }
}
