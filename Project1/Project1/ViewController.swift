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
    
    var pictures = [Picture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        
        //Create file manager
        let fileManager = FileManager.default
        
        //Create path
        let path = Bundle.main.resourcePath!
        
        //item from the directory path
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        let defaults = UserDefaults.standard
        
        if let savedPictures = defaults.object(forKey: "pictures") as? Data{
            let jsonDecoder = JSONDecoder()
            
            do{
                pictures = try jsonDecoder.decode([Picture].self, from: savedPictures)
            }catch{
                print("Error to load pictures")
            }
            
            pictures = pictures.sorted(by: { (pictureOne: Picture, pictureTwo: Picture) -> Bool in
                return pictureOne.pictureName < pictureTwo.pictureName
            })
            
        }else{
            for item in items{
                if item.hasPrefix("nssl"){
                    let picture = Picture()
                    picture.pictureName = item
                    pictures.append(picture)
                }
                
            }
        }
        
       
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PicturesTableViewCell", for: indexPath) as! PicturesTableViewCell
        
        cell.textLabel?.text = pictures[indexPath.row].pictureName
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let picture = pictures[indexPath.row]
            picture.numberOfTimesShowed = picture.numberOfTimesShowed + 1
            vc.selectedImage = picture.pictureName
            vc.selectedImageIndex = indexPath.row + 1
            save()
            vc.totalImages = pictures.count
            vc.picture = picture
            navigationController?.pushViewController(vc, animated: true)
            
        }

        
    }
    
    /// This method save the People array as UserDefaults encoded as JSON
    func save(){
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(pictures){
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey:"pictures")
        }else{
            print("Failed to save data")
        }
    }

}
