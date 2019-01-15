//
//  CustomSegue.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 18.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let containerView = source.view.superview else { return }
        
        let containerViewFrame = containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: -containerViewFrame.height,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        
        let destinationViewTargetFrame = source.view.frame
        
        destination.view.transform = CGAffineTransform(rotationAngle: CGFloat(180*Double.pi))
        
        containerView.addSubview(destination.view)
        destination.view.frame = CGRect(x: 0,
                                        y: containerViewFrame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)
        

        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.source.view.frame = sourceViewTargetFrame
                        
                        self.destination.view.frame = destinationViewTargetFrame
                        
        }) { finished in
            self.source.present(self.destination,
                                animated: false,
                                completion: nil)
        }
    }
}

