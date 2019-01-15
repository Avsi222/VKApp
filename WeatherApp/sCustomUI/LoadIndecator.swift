//
//  LoadIndecator.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 11.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit

@IBDesignable class LoadController: UIView {
    
    
    
    var view = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    var view2 = UIView.init(frame: CGRect(x: -15, y: -30, width: 20, height: 20))
    
    var view3 = UIView.init(frame: CGRect(x: -30, y: 0, width: 20, height: 20))
    
    let shapeLayer1 = CAShapeLayer()
    
    let shapeLayer2 = CAShapeLayer()
    
    let shapeLayer3 = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        let x = frame.width/2
        let y = frame.height/2
        
        view = UIView.init(frame: CGRect(x: x, y: y, width: 20, height: 20))
        
        view2 = UIView.init(frame: CGRect(x: x-15, y: y-30, width: 20, height: 20))
        
        view3 = UIView.init(frame: CGRect(x: x-30, y: y, width: 20, height: 20))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        
        let x = frame.width/2
        let y = frame.height/2
        
        view = UIView.init(frame: CGRect(x: x, y: y, width: 20, height: 20))
        
        view2 = UIView.init(frame: CGRect(x: x-15, y: y-30, width: 20, height: 20))
        
        view3 = UIView.init(frame: CGRect(x: x-30, y: y, width: 20, height: 20))
    }
    

    
    private func setupView(){
        
        view.backgroundColor = .red
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        view2.backgroundColor = .red
        view2.layer.cornerRadius = 10
        view2.layer.masksToBounds = true
        
        view3.backgroundColor = .red
        view3.layer.cornerRadius = 10
        view3.layer.masksToBounds = true
        
        addSubview(view)
        
        addSubview(view2)
        
        addSubview(view3)
        
        UIView.animate(withDuration: 1, delay: 1.5, options: [.repeat, .autoreverse], animations: {
            self.view.alpha = 0
        })
        UIView.animate(withDuration: 1, delay: 1, options: [.repeat, .autoreverse], animations: {
            self.view2.alpha = 0
        })
        
        UIView.animate(withDuration: 1, delay: 2, options: [.repeat, .autoreverse], animations: {
            self.view3.alpha = 0
        })
        
        //view.fadeIn()
        //view.fadeOut()
    }
    
}
public extension UIView {
    
    func fadeIn(withDuration duration: TimeInterval = 5.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    /// Fade out a view with a duration
    ///
    /// - Parameter duration: custom animation duration
    func fadeOut(withDuration duration: TimeInterval = 5.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
}
