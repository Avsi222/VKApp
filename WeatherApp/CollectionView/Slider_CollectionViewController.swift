//
//  Slider_CollectionViewController.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 15.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class Slider_CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromBottom, .showHideTransitionViews]
    
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhoto()
        
        
        let recognizerLeft = UISwipeGestureRecognizer.init(target: self, action: #selector(swiping))
        recognizerLeft.direction = .left
        collectionView.addGestureRecognizer(recognizerLeft)
        
        let recognizerRight = UISwipeGestureRecognizer.init(target: self, action: #selector(swiping2))
        recognizerRight.direction = .right
        collectionView.addGestureRecognizer(recognizerRight)
    }
    
    var x = 0
    
    @objc func swiping(){
        print("I am swiping left")
        
        let indexPath = IndexPath(item: x, section: 0)
        
        
        let nowcell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! slider_collection_Cell
        
        UIView.animate(withDuration: 2, delay: 0.0, options: .autoreverse, animations: {
            self.animationResize(viewToAnimate: nowcell.Image)
        }) { (true) in
            print("Done")
            
            self.scrollToNextCell()
        }
        
        
        
    }
    @objc func swiping2(){
        print("I am swiping right")
        
        let indexPath = IndexPath(item: x, section: 0)
        
        let nowcell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! slider_collection_Cell
        
        UIView.animate(withDuration: 2, delay: 0.0, options: .curveEaseIn, animations: {
            self.animationResize(viewToAnimate: nowcell.Image)
        }) { (true) in
            print("Done")
            
            self.scrollToPrevCell()
        }
        
        
        
    }
    
    func animationResize(viewToAnimate:UIImageView){
        
        let animation = CASpringAnimation(keyPath: "bounds")
        animation.fromValue = viewToAnimate.layer.bounds
        animation.toValue = CGRect.init(x: viewToAnimate.layer.bounds.origin.x, y: viewToAnimate.layer.bounds.origin.y, width: viewToAnimate.layer.bounds.width / 1.4,height: viewToAnimate.layer.bounds.width / 1.4)
        
        
        animation.stiffness = 300
        animation.mass = 1.5
        animation.duration = 0.8
        viewToAnimate.layer.add(animation, forKey: nil)
        
    }
    
    func scrollToPrevCell(){
        
        x = x - 1
        
        if x >= images.count{
            x = 0
        }
        let indexPath = IndexPath(item: x, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    func scrollToNextCell(){
        
        x = x + 1
        
        if x >= images.count{
            x = 0
        }
        let indexPath = IndexPath(item: x, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    func loadPhoto(){
        
        images.append(UIImage(named: "1")!)
        
        images.append(UIImage(named: "2")!)
        
        images.append(UIImage(named: "3")!)
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of section
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! slider_collection_Cell
        cell.backgroundColor = .black
        cell.Image.image = images[indexPath.row]
        
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = collectionView.bounds.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    

}

class slider_collection_Cell: UICollectionViewCell{
    
    @IBOutlet weak var Image: UIImageView!
    
}
