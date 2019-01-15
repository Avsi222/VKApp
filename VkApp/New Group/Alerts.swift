//
//  Alerts.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 01/12/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit

public class AlertFun {
    class func ShowAlert(title: String, message: String, in vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    class func ErrorAlert(errorDesc: String, in vc: UIViewController) {
        let alert = UIAlertController(title: "Ошибка", message: errorDesc, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
