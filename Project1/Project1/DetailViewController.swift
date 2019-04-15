//
//  DetailViewController.swift
//  Project1
//
//  Created by Flavio Costa on 04/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblNumberOfTimesShowed: UILabel!
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedImageIndex: Int?
    var totalImages: Int?
    var picture: Picture!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        if let imageIndex = selectedImageIndex, let tImages = totalImages {
            self.title = "Picture \(imageIndex) of \(tImages)"
        }
        
        
        let numberOfTimesShowed = picture.numberOfTimesShowed == 1 ? "Showed \(picture.numberOfTimesShowed) time" : "Showed \(picture.numberOfTimesShowed) times"
        
        lblNumberOfTimesShowed.text = numberOfTimesShowed
       
    }

}
