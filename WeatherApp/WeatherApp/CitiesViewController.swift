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
    
    @IBAction func addCity(_ sender: Any) {
        let alert = UIAlertController(title: "Имя", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "название"
        }
        let action = UIAlertAction(title: "OK", style: .default) { [weak self, weak alert] (action) in
            guard let firstText = alert?.textFields?.first else { return }
            self?.addCity(name: firstText.text ?? "")
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func addCity(name: String) {
        guard !name.isEmpty else { return }
        cities.append(name)
        // tableView.reloadData()
         tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }

}

extension CitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // sections[sectionTitles[section]]?.count ?? 0
        cities.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitles.map{ String($0) }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityCell else { fatalError() }
        cell.titleLabel.text = cities[indexPath.row]
        print("Cell created \(indexPath.row)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

extension CitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat((40...100).randomElement()!)
//    }
}
