//
//  RepostControl.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 15.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

//
//  LIkeControl.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 01.10.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit

@IBDesignable class MyRepostController: UIControl {
    
    
    //private var button:UIButton!
    var kolvo = 0
    var label_count = UILabel.init(frame: CGRect(x: 50, y: 0, width: 36, height: 36))
    var is_tapped = false
    var view = UIView.init(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
    var button = UIButton.init(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
    
    let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromBottom, .showHideTransitionViews]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        addSubview(view)
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "Repost"), for: .normal)
        view.addSubview(button)
        
        
        label_count.text = "\(kolvo)"
        label_count.textAlignment = .center
        view.addSubview(label_count)
        
        let recognizer = UITapGestureRecognizer.init(target: self, action: #selector(daySelected2))
        button.addGestureRecognizer(recognizer)
        
    }
    
    @objc func daySelected2() {
        print("tap2")
        
        UIView.transition(from: button,
                          to: button,
                          duration: 0.5,
                          options: transitionOptions,
                          completion: nil)
        
        if is_tapped{
            kolvo-=1
            is_tapped = false
            label_count.textColor = .black
            button.setBackgroundImage(UIImage(named: "Repost"), for: .normal)
        }else{
            kolvo+=1
            is_tapped = true
            label_count.textColor = .red
            button.setBackgroundImage(UIImage(named: "TapRepost"), for: .normal)
        }
        
        label_count.text = "\(kolvo)"
    }
    
 
    
}
