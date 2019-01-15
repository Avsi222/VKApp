//
//  MyCollectionViewController.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 24.09.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyCollectionViewController: UICollectionViewController {
    
    
    private let PhotoLoader = Photodownload()
    private let userServ = UserService()
    private var users = [UserRealm]()
    
    private let photoServ = PhotoService()
    private var photos = [PhotoRealm]()
    
    var UserId:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userServ.loadUser(for: UserId ?? "101274519") { [weak self] users, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let users = users, let self = self else { return }

            
            self.users = users
            
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
        
        photoServ.loadPhotoProfile(userId: UserId ?? "101274519") { [weak self] photo, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let photos = photo, let self = self else { return }
            
            
            self.photos = photos
            
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }


    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return users.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! User_collection_Cell
        
        print("Download Started")
        
        PhotoLoader.DownloadPhoto(url: users[indexPath.row].photoUrl) { (image) in
            cell.ProfileImage.image = image
        }
        cell.AboutText.text = users[indexPath.row].aboutMe
        cell.SurnameLabel.text = users[indexPath.row].firstName + " " + users[indexPath.row].lastName
        cell.AgeLabel.text = users[indexPath.row].age
    
        return cell
    }
    


}
class User_collection_Cell: UICollectionViewCell{
    
    @IBOutlet weak var SurnameLabel: UILabel!
    @IBOutlet weak var AboutText: UITextView!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var AgeLabel: UILabel!

    
}
