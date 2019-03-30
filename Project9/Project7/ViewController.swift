//
//  ViewController.swift
//  Project7
//
//  Created by Flavio Costa on 26/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var allPetitions = [Petition]()
    var filteredPetitions = [Petition]()
    var alertTitle: String!
    var alertMessage: String!
    var activityIndicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSearchButton()
        
        createCreditButton()

        performSelector(inBackground: #selector(fetchJSON), with: nil)
        
    }
    
    func createCreditButton(){
        
        let creditButton = UIBarButtonItem(title: "Credits", style: .done, target: self, action: #selector(showCreditsAlert))
        navigationItem.rightBarButtonItem = creditButton
    
    }
    
    func createSearchButton(){
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterList))
        navigationItem.leftBarButtonItem = searchButton
        
    }
    
    @objc func filterList(){
        
        let alertController = UIAlertController.init(title: "Enter a text", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        
        let action = UIAlertAction(title: "Filter", style: .default){ [weak self, weak alertController] _ in
            
            guard let text = alertController?.textFields?[0].text else {return}
           
           
            DispatchQueue.global(qos: .background).async { [weak self] in
                
                self?.filter(text: text)
                
            }
            
            
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    func filter(text:String){
        
        filteredPetitions.removeAll()
        
        if !text.isEmpty{
            for petition in allPetitions{
                if petition.body.contains(text) || petition.title.contains(text){
                    filteredPetitions.append(petition)
                }
            }
        }else{
            filteredPetitions = allPetitions
        }
        
        tableView.performSelector(onMainThread:#selector(tableView.reloadData), with: nil, waitUntilDone: false)
        
       // tableView.reloadData()
        
    }
    
    @objc func showCreditsAlert(){
        alertTitle = "Credits"
            alertMessage = "The data used in this app comes from the We The People API of the Whitehouse"
        showAlert()
    }
    
    @objc func showAlert(){
        
        let ac = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        
    }
    
    @objc func fetchJSON(){
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0{
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        }else{
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        //Create a URL from the url string
         if let url = URL(string: urlString){
            //Get data from the url
            if let data = try? Data(contentsOf: url){
                //Call parse json passing the taken data
                parseJSON(json: data)
                return
            }
         }
        
        alertTitle = "Loading Error"
        alertMessage = "There was a problem loading the feed. Please check the internet connection and try again."
        
        performSelector(onMainThread: #selector(showAlert), with: nil, waitUntilDone: false)
        
    }
    
    func parseJSON(json: Data){
        
        //Create a JSONDecoder to decode the JSON from the passed data
        let decoder = JSONDecoder()
        
        //Using the json decoder, decode the data and put it as Petitions
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            allPetitions = jsonPetitions.results
            filteredPetitions = allPetitions
            
            tableView.performSelector(onMainThread: #selector(tableView.reloadData), with: nil, waitUntilDone: false)
            //Using DispatcheQueue could be:
            //Run this code in the Main Thread because it is a UI work
            /*DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }*/
            
        }else{
            alertTitle = "Loading Error"
            alertMessage = "There was a problem loading reading the downloaded data."
            
            performSelector(onMainThread: #selector(showAlert), with: nil, waitUntilDone: false)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPetitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

