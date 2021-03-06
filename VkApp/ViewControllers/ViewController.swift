//
//  ViewController.swift
//  WeatherApp
//
//  Created by Арсений Дорогин on 20.09.2018.
//  Copyright © 2018 AVSI. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var LoginTF: UITextField!
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginTF.text = "Admin"
        PasswordTF.text = "123456" //Чтобы не печатать каждый раз
        print(Session.shared.token)
        print(Session.shared.userId)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Login_Button_Pressed(_ sender: UIButton) {
        if LoginTF.text == "Admin" && PasswordTF.text == "123456"{
            performSegue(withIdentifier: "Login-Ok", sender: self)
        }else{
            let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alter.addAction(action)
            present(alter, animated: true, completion: nil)
        }
    }
    
    @objc func keyBoardAppeared(_ notification: Notification) {
        if let keyboardInfo = notification.userInfo as NSDictionary? {
            let size = (keyboardInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
            let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
            self.scrollView.contentInset = contentInset
            self.scrollView.scrollIndicatorInsets = contentInset
        }
    }
    
    @objc func keyBoardWasHidden() {
        self.scrollView.contentInset = UIEdgeInsets.zero
        self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardAppeared(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasHidden),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardAppeared(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasHidden),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

