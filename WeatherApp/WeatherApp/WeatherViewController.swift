//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by 2lup on 01.11.2022.
//

import UIKit

//class myLayout: UICollectionViewLayout {
//    
//}

class WeatherViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var weather = [
        WeatherData(temperature: 30, humidity: 0.2),
        WeatherData(temperature: 24, humidity: 0.3),
        WeatherData(temperature: 27, humidity: 0.4),
        WeatherData(temperature: 23, humidity: 0.5),
        WeatherData(temperature: 30, humidity: 0.2),
        WeatherData(temperature: 24, humidity: 0.3),
        WeatherData(temperature: 27, humidity: 0.4),
        WeatherData(temperature: 23, humidity: 0.5),
        WeatherData(temperature: 30, humidity: 0.2),
        WeatherData(temperature: 24, humidity: 0.3),
        WeatherData(temperature: 27, humidity: 0.4),
        WeatherData(temperature: 23, humidity: 0.5),
        WeatherData(temperature: 30, humidity: 0.2),
        WeatherData(temperature: 24, humidity: 0.3),
        WeatherData(temperature: 27, humidity: 0.4),
        WeatherData(temperature: 23, humidity: 0.5),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            print("444")
            layout.itemSize = CGSize(width: 200, height: 200)
            // layout.minimumLineSpacing = 10
        }
    }

}

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WetherCell else {
            fatalError()
        }
        
        let data = weather[indexPath.row]
        cell.humidity.text = String(data.humidity)
        cell.temperature.text = String(data.temperature)
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
