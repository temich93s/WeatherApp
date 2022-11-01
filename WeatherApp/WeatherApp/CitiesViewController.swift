//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by 2lup on 01.11.2022.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBAction func refreshTable(_ sender: Any) {
        cities.shuffle()
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var cities = ["Москва", "Уфа", "Пермь", "Осло", "Уфа", "Пермь", "Осло", "Уфа", "Пермь", "Осло", "Уфа", "Пермь", "Осло", "Уфа", "Пермь", "Осло", "Уфа", "Пермь", "Осло", "Уфа", "Пермь", "Осло", "Уфа", "Пермь", "Осло"]
    
    var sections: [Character: [String]] = [:]
    var sectionTitles = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        for city in cities {
            let firstLetter = city.first!
            
            if sections[firstLetter] != nil {
                sections[firstLetter]?.append(city)
            } else {
                sections[firstLetter] = [city]
            }
        }
        
        sectionTitles = Array(sections.keys)
    }

}

extension CitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[sectionTitles[section]]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitles.map{ String($0) }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sectionTitles[section])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityCell else { fatalError() }
        guard let city = sections[sectionTitles[indexPath.section]]?[indexPath.row] else {
            fatalError()
        }
        cell.titleLabel.text = city
        print("Cell created \(indexPath.row), \(city)")
        return cell
    }
}

extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat((40...100).randomElement()!)
    }
}
