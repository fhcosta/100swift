//
//  DetailViewController.swift
//  Project1
//
//  Created by Flavio Costa on 04/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedImageIndex: Int?
    var totalImages: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set navigation bar to never shows large title
        navigationItem.largeTitleDisplayMode = .never
        
        //Create a right bar button using the default action button and set a action when user tap this button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTapped))
        
        //If there is a selected image set it as the imageView image
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        //Get the index of this image and the total of image. Show it as Title
        if let imageIndex = selectedImageIndex, let tImages = totalImages {
            self.title = "Picture \(imageIndex) of \(tImages)"
        }
       
    }

    @objc func sharedTapped(){
        
        //Compress the current image in jpegData
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else{
            print("Image not found")
            return
        }
        
        
        //Show a popover with the options to share your photo
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
