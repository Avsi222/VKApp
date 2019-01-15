//
//  News_TableViewController.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 08.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class News_TableViewController: UITableViewController {

    var news = [NewsClass]()
    
    private let newsServ = NewsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.main.async {
            for _ in (0..<10){
                print("DispatchQueue.main().async")
            }
        }
        DispatchQueue.global().sync {
            for _ in (0..<10){
                print("DispatchQueue.global().sync")
            }
        }
    
            self.newsServ.loadNewsList(){ [weak self] news, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let news = news, let self = self else { return }
                
                
                self.news = news
                
                
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            }
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_id", for: indexPath) as! NewsCell

        cell.TextLabel.text = news[indexPath.row].text
        cell.TitleLabel.text = news[indexPath.row].name
        let url = URL(string: news[indexPath.row].photoWall)
        if url != nil{
            let resourses = ImageResource(downloadURL: url!, cacheKey: news[indexPath.row].photoWall) //кэштироваание
            cell.Images.kf.setImage(with: resourses)
        }
        
        let url2 = URL(string: news[indexPath.row].AvaPhoto)
        
        if url2 != nil{
            let resourses = ImageResource(downloadURL: url2!, cacheKey: news[indexPath.row].AvaPhoto) //кэштироваание
            cell.AvaImage.kf.setImage(with: resourses)
        }
        
        cell.Likes.kolvo = news[indexPath.row].likes
        cell.Likes.label_count.text = String(cell.Likes.kolvo)
        
        cell.Comments.kolvo = news[indexPath.row].comments
        cell.Comments.label_count.text = String(cell.Comments.kolvo)
        
        cell.Reposts.kolvo = news[indexPath.row].reposts
        cell.Reposts.label_count.text = String(cell.Reposts.kolvo)
        
        
        return cell
    }
    

}

class NewsCell: UITableViewCell{
    
    @IBOutlet weak var TitleLabel:UILabel!
    @IBOutlet weak var TextLabel: UILabel!
    @IBOutlet weak var Images: UIImageView!
    @IBOutlet weak var AvaImage: UIImageView!
    
    @IBOutlet weak var Likes: MyLikeController!
    @IBOutlet weak var Comments: MyCommentController!
    
    @IBOutlet weak var Looks: UILabel!
    @IBOutlet weak var Reposts: MyRepostController!
}


