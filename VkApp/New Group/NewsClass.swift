//
//  NewsClass.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 07/01/2019.
//  Copyright © 2019 AVSI. All rights reserved.
//


class NewsClass {
    
    let name: String
    let AvaPhoto: String
    let text: String
    let likes:Int
    let comments:Int
    let reposts:Int
    let photoWall: String
    
    
    
    init(name: String, likes: Int,repost:Int,Comment:Int,avaphoto:String,text:String,photoWall:String) {
        self.name = name
        self.likes = likes
        self.AvaPhoto = avaphoto
        self.photoWall = photoWall
        self.text = text
        self.comments = Comment
        self.reposts = repost
    }
    
}
