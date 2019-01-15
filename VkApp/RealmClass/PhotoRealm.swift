//
//  PhotoRealm.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 28/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import Foundation
import RealmSwift

class PhotoRealm: Object {
    
    enum Properties: String {
        case idUser
        case photoUrl
    }

    
    @objc dynamic var idUser: Int = 0
    @objc dynamic var photoUrl: String = ""
    
    convenience init(id: Int,photoUrl:String) {
        self.init()
        self.idUser = id
        self.photoUrl = photoUrl
    }
    
    override static func primaryKey() -> String? {
        return Properties.idUser.rawValue
    }
    
    override static func indexedProperties() -> [String] {
        return [Properties.photoUrl.rawValue]
    }
    
    override static func ignoredProperties() -> [String] {
        return [""]
    }
}

class Photodownload{
    func DownloadPhoto(url:String,completion:@escaping (UIImage?) -> ()) {
        let url = URL(string: url)
        getData(from: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                completion(UIImage(data: data))
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
