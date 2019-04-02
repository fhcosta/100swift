//
//  ViewController.swift
//  Project10
//
//  Created by Flavio Costa on 01/04/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
    }

    @objc func addNewPerson(){
    
        let imgPicker = UIImagePickerController()
    
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imgPicker.sourceType = .camera
        }else{
            imgPicker.sourceType = .photoLibrary
        }
        
        imgPicker.allowsEditing = true
        imgPicker.delegate = self
        present(imgPicker, animated: true)
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as? PersonCell else {
            fatalError("Not found this Cell")
        }
        
        let person = people[indexPath.item]
        cell.lblName.text = person.name
        
        let imagePath = getDocumentDirectory().appendingPathComponent(person.image)
        cell.imgPerson.image = UIImage(contentsOfFile: imagePath.path)
        cell.imgPerson.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imgPerson.layer.borderWidth = 2
        cell.imgPerson.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "What do you want to do?", message: "Rename or Delete?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Rename", style: .default){ [weak self] _ in
            
            self?.addNewPersonAlert(indexPath: indexPath)
        })
        
        alert.addAction(UIAlertAction(title: "Delete", style: .default){ [weak self] _ in
            
            self?.people.remove(at: indexPath.item)
            collectionView.reloadData()
        })
        present(alert, animated: true)
        
        
    }
    
    func addNewPersonAlert(indexPath: IndexPath){
        
        let person = self.people[indexPath.item]
        let ac = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] _ in
            guard let newName = ac?.textFields?[0].text else {return}
            person.name = newName
            self?.collectionView.reloadData()
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(ac, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else {return}
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8){
            try? jpegData.write(to: imagePath)
        }
        
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        collectionView.reloadData()
        
        
        dismiss(animated: true)
    }
    
    func getDocumentDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
    }
}

