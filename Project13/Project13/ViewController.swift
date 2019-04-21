//
//  ViewController.swift
//  Project13
//
//  Created by Flavio Costa on 19/04/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import CoreImage
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var intensity: UISlider!
    
    var currentImage: UIImage!
    
    var context: CIContext!
    var currentFilter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
    }

    @objc func importPicture(){
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let image = imageView.image else {return}
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @IBAction func changeFilter(_ sender: UIButton) {
        
        let ac = UIAlertController(title: "Choose Filter", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Cancel", style: .default))
       
        if let popoverController = ac.popoverPresentationController{
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        
        present(ac, animated: true)
    }
    
    func setFilter(action: UIAlertAction){
        
        //make sure we have a valid image
        guard currentImage != nil else {return}
        
        //safely read the alert action's title
        guard let actionTitle = action.title else {return}
        
        guard let filter = CIFilter(name: actionTitle) else {return}
        
        currentFilter = filter
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
    }
    
    
    @IBAction func intensityChanged(_ sender: Any) {
        applyProcessing()
    }
    
    // MARK: - UIImagePicker Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        dismiss(animated: true)
        currentImage = image
       
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    func applyProcessing(){
        
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey){
            currentFilter.setValue(intensity.value, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey){
            currentFilter.setValue(intensity.value*200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey){
            currentFilter.setValue(intensity.value*10, forKey: kCIInputScaleKey)
        }
        if inputKeys.contains(kCIInputCenterKey){
            currentFilter.setValue(CIVector(x: currentImage.size.width/2, y: currentImage.size.height/2), forKey: kCIInputCenterKey)
        }
        guard let outputImage = currentFilter.outputImage else {return}
       // currentFilter.setValue(intensity.value, forKey: kCIInputIntensityKey)
        
    
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent){
            let processedImage = UIImage(cgImage: cgimg)
            imageView.image = processedImage
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        
        if let error = error{
            showAlert(title: "Save error", message: error.localizedDescription, actions: [UIAlertAction(title: "Ok", style: .default)])
        }else{
            showAlert(title: "Saved", message: "Your altered image has been saved in in your library", actions: [UIAlertAction(title: "OK", style: .default)])
        }
        
    }
    
    func showAlert(title: String, message:String,actions: [UIAlertAction]){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions{
            alert.addAction(action)
        }
        present(alert, animated: true)
        
    }
}

