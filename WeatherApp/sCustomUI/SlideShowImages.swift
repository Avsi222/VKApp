//
//  SlideShowImages.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 15.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//


import UIKit


class ImageSLider: UIImageView {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
        //self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
        //self.addGestureRecognizer(tapGestureRecognizer)
    }
    
 

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let imageView = tapGestureRecognizer.view as! UIImageView
        print("TAPPED")
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        
        //tapGestureRecognizer.view.navigationController?.pushViewController(newViewController, animated: true)
        
        //tapGestureRecognizer.view?.addSubview(newImageView)
        //self.view.addSubview(newImageView)
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        //sender.view?.removeFromSuperview()
    }
    
}
