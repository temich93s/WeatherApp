//
//  ViewController.swift
//  WeatherApp
//
//  Created by 2lup on 31.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
        guard let logintext = loginField.text else { return }
        guard let pwdtext = passwordField.text else { return }
        if logintext == "admin", pwdtext == "12345" {
            print("Успех")
        } else {
            print("Неуспех")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillShown(notification: Notification) {
        let info = notification.userInfo as! NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        // cоздаем отступ
        let contectInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0)
        // дополнительные отступы в рамках внутреннего размера
        scrollView.contentInset = contectInsets
        // задаем отступ индикатору
        scrollView.scrollIndicatorInsets = contectInsets
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // отписываемся от нотификаций когда мы уходим с экрана
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }

}

