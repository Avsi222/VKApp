//
//  FirebaseFunctions.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 01/12/2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import FirebaseDatabase

public class FbDatabas{
    
    
    class func SaveData(path:String,info:NSDictionary,in vc:UIViewController,alert:Bool) {
            let ref = Database.database().reference()
            let profile = ref.child(byAppendingPath: path)
            profile.updateChildValues(info as! [AnyHashable : Any]) { (error:Error?, ref:DatabaseReference) in
                if error != nil{
                    if alert{
                        AlertFun.ErrorAlert(errorDesc: error as! String, in: vc)
                    }
                    print("ERROR",error ?? "")
                }
                print("ALL ok")
                if alert{
                    AlertFun.ShowAlert(title: "Данные успешно обновлены", message: "", in: vc)
                }
                
            }
    }
}
