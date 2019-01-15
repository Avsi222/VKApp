//
//  CustomAnimator.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 18.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.frame = source.view.frame
        
        destination.view.transform = CGAffineTransform(rotationAngle: CGFloat(90))
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        let translation = CGAffineTransform(translationX: -700, y: 0)
                                                        source.view.transform = translation
                                    })

                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.8,
                                                       animations: {
                                                        let translation = CGAffineTransform(rotationAngle: CGFloat(-90))
                                                        destination.view.transform = translation
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.65,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        destination.view.transform = .identity
                                    })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
    
}
