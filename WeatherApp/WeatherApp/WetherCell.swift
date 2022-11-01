//
//  WetherCell.swift
//  WeatherApp
//
//  Created by 2lup on 01.11.2022.
//

import UIKit

class WetherCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 10
        backView.layer.borderWidth = 3
        backView.layer.borderColor = UIColor.black.cgColor
        
    }
}
