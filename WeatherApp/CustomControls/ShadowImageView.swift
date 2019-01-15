//
//  ShadowImageView.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 01.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit

@IBDesignable class ShadowImage: UIImageView {
    
    var button = UIButton.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    @IBInspectable var shadowcolor: UIColor = .black {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var shadowradius: CGFloat = 40 {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var shadowopacity: Float = 0.7 {
        didSet {
            updateColors()
        }
    }
    
    @IBInspectable var cornerradius: CGFloat = 10 {
        didSet {
            updateColors()
        }
    }
    @IBInspectable var maskstobounds: Bool = true {
        didSet {
            updateColors()
        }
    }
    
    private func updateColors() {
        self.layer.shadowColor = shadowcolor.cgColor
        //self.layer.shadowOffset = CGSize.init(width:0,height:0)
        self.layer.shadowRadius = shadowradius
        self.layer.shadowOpacity = shadowopacity
        self.layer.masksToBounds = maskstobounds
        self.layer.cornerRadius = cornerradius
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    
    
     @objc func animateWithCALayer(_ sender: Any) {
        print("TApped")
    }
    
}
