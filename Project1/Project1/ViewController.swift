//
//  ViewController.swift
//  Project1
//
//  Created by Flavio Costa on 03/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

   // @IBOutlet var tableView: UITableView!
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        
        //Create file manager
        let fileManager = FileManager.default
        
        //Create path
        let path = Bundle.main.resourcePath!
        
        //item from the directory path
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items{
            
            if item.hasPrefix("nssl"){
               pictures.append(item)
            }
            
        }

        pictures = pictures.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 < s2
        })
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PicturesTableViewCell", for: indexPath) as! PicturesTableViewCell
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedImageIndex = indexPath.row + 1
            vc.totalImages = pictures.count
            navigationController?.pushViewController(vc, animated: true)
            
        }

        
    }

}
