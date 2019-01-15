//
//  FriendClass.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 09/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//


import UIKit
import SwiftyJSON


class Friends {
    
    var id:String!
    var first_name:String!
    var last_name:String!
    var photo:UIImage!
    var UrlForPhoto:String!
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        
        self.first_name = json["first_name"].stringValue
        self.last_name = json["last_name"].stringValue
        
        self.UrlForPhoto = json["photo_100"].stringValue
        /*if let url = URL(string: self.UrlForPhoto) {
            //downloadImage(from: url)
            ReturnImage(from: url) { (image, error) in
                print(error)
                self.photo = image
            }
        }*/
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.photo = UIImage(data: data)
            }
        }
    }
    
    func ReturnImage(from url: URL, completion: @escaping (UIImage?, Error?) -> ()) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                completion(UIImage(data: data), error)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

/*
 "id": 210700286,
 "first_name": "Lindsey",
 "last_name": "Stirling",
 "city": {
 "id": 5331,
 "title": "Los Angeles"
 },
 "photo_50": "https://pp.vk.me/...f6e/4-funfNRMwg.jpg",
 "verified": 1
 */

