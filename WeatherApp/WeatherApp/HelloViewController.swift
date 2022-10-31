//
//  HelloViewController.swift
//  WeatherApp
//
//  Created by 2lup on 31.10.2022.
//

import UIKit

class HelloViewController: UIViewController {
    
    @IBOutlet weak var centerText: UILabel!
    
    var name: String?
    
    @IBAction func addWord(_ sender: UIBarButtonItem) {
        centerText.text = "Hell0"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HelloViewController viewWillAppear")
        centerText.text = name
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HelloViewController viewWillDisappear")
    }

}
