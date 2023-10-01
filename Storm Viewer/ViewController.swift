//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Kriti on 2023-09-28.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(KritiTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returning the array count to populate the rows
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //making a reusable custom cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? KritiTableViewCell else {
            fatalError("Failed to dequeue a KritiTableViewCell.")
        }        
        //adding text to the cell
        cell.stormLabel.text = "Storm \(pictures[indexPath.row].getId(replace: ".jpg", with: "", length: 2))"
        cell.stormLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Storm collection [1987 - 2023]:"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.totalImages = pictures.count
            vc.imageIndex = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

class KritiTableViewCell: UITableViewCell {
  
}
