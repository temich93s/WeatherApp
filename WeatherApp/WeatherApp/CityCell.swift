//
//  CityCell.swift
//  WeatherApp
//
//  Created by 2lup on 01.11.2022.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    // вызыввается когда ячейка со старой позиции перемечается на новую позицию
    override func prepareForReuse() {
        // тут мы делаем очистку что бы асинхронные данные не испортили данные
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
