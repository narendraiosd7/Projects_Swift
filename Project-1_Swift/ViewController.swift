//
//  ViewController.swift
//  Project-1_Swift
//
//  Created by narendra.vadde on 16/05/21.
//

import UIKit

class ViewController: UITableViewController {

    var images = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm View"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                images.append(item)
            }
        }
        
        images.sort()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath)
        cell.textLabel?.text = images[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let details = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController {
            details.selectedImage = images[indexPath.row]
            details.totalImages = images.count
            details.selectedImageCount = indexPath.row
            navigationController?.pushViewController(details, animated: true)
        }
    }
}

