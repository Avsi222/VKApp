//
//  GroupPost_ViewController.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 20/11/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit

class GroupPost_ViewController: UIViewController {

    
    var groupP = [GroupPost]()
    
    var GroupId:String!
    
    private let groupServ = GroupService()
    
    @IBOutlet weak var groupImage:UIImageView!
    @IBOutlet weak var NameGroup:UILabel!
    @IBOutlet weak var DesctiptGroup:UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupServ.loadGroupInfo(for: GroupId ?? "55293029"){ [weak self] friends, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let friends = friends, let self = self else { return }
            
            
            self.groupP = friends
            
            
            DispatchQueue.main.async {
                //userServ
                //print(self.FriendList)
                for group in self.groupP{
                    self.DesctiptGroup.text = group.desctiption
                    self.NameGroup.text = group.name
                    self.imageLoad(SUrl: group.UrlForPhoto)
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func imageLoad(SUrl:String){
        let url = URL(string: SUrl)
        getData(from: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.groupImage.image = UIImage(data: data)
            }
        }
    }
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    

}
