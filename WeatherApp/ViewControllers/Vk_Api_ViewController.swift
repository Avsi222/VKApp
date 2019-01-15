//
//  Vk_Api_ViewController.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 09/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit
import Alamofire

class Vk_Api_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func FriendsList(_ sender: Any) {
        loadUserFriendsAlamofire()
    }
    
    @IBAction func GroupList(_ sender: Any) {
        loadUserGroupsAlamofire()
    }
    @IBAction func PhotoDownload(_ sender: Any) {
        loadUserPhotoAlamofire()
    }
    @IBAction func SearchByGroup(_ sender: Any) {
        loadUserGroupSearchAlamofire()
    }
    
    func loadUserGroupSearchAlamofire() {
        
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "q": "Music",
            "count":"3",
            "v": "5.87"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                print(value)
            }
        }
    }
    
    func loadUserPhotoAlamofire() {
        
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/users.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "fields": "photo_50",
            "user_ids":"101274519",
            "v": "5.87"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                print(value)
            }
        }
    }
    
    func loadUserGroupsAlamofire() {
        
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "extended": "1",
            "v": "5.52"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                print(value)
            }
        }
    }
    func loadUserFriendsAlamofire() {
        
        let baseUrl = "https://api.vk.com"
        
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "order":"random",
            "v":"5.87"
            
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
                print(value)
            }
            print("FirendsLoaded")
        }
    }

}
