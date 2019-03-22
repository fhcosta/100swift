//
//  ViewController.swift
//  Project5
//
//  Created by Flavio Costa on 22/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //MARK: - Variables
    var usedWords = [String]()
    var allWords = [String]()
    var totalOfWords = 0
    var lblTotalOfWords = UILabel()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(startGame))
        navigationController?.isToolbarHidden = false
       
        
        lblTotalOfWords.text = "Total of words= \(totalOfWords)"
        lblTotalOfWords.sizeToFit()
        navigationController?.toolbar.addSubview(lblTotalOfWords)
        
        
        // If in the Main Bundle exists a file named start.txt and if in this file is possible to get the contents of it, store this content separated by \n as a string in the allWords array
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        //if allWords is empty add a static value
        if allWords.isEmpty{
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    //MARK: - Structural
    //When start a new game, change the view title for a new random string
    //remove all contents of usedWords
    //reload table view
    @objc func startGame(){
        
        self.title = allWords.randomElement()
        usedWords.removeAll()
        tableView.reloadData()
        
    }
    
    //Create a UIAlertController and present it with a textField allowing users to insert a text. Create the submit action using a closure that gets the content of the textField and send it to the submit method
    @objc func promptAnswer(){
        
        let alertController = UIAlertController.init(title: "Enter a word", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        
        let action = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak alertController] _ in
            guard let answer = alertController?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
        
    }
    
    //Verify if the submitted word respect some rules and then insert this word in the usedWords array. Update the tableView inserting this item in the top row (0) of the tableView.
    func submit(_ answer: String){
        
        
        if isPossible(word: answer){
            if isOriginal(word: answer){
                if isReal(word: answer){
                    if isHardToCreate(word: answer){
                        usedWords.insert(answer, at: 0)
                        let indexPath = IndexPath(item: 0, section: 0)
                        tableView.insertRows(at: [indexPath], with: .automatic)
                        totalOfWords += 1
                        lblTotalOfWords.text = "Total of words= \(totalOfWords)"
                    }else{
                        showAlertWithTitle(title: "So easy", andMessage: "Write a word longer than that!")
                    }
                }else{
                    showAlertWithTitle(title: "Word not Recognized", andMessage: "You can do that, try again!")
                }
            }else{
                showAlertWithTitle(title: "Word used already", andMessage: "Be more Original!")
            }
        }else{
            guard let title = title?.lowercased() else {return}
            showAlertWithTitle(title: "Word not possible", andMessage: "You can't spell that word from \(title)")
        }
        
    }
    
    //Verify if is possible to create a word from the given word
    func isPossible(word: String) -> Bool{
        guard var tempWord = title?.lowercased() else { return false}
        
        for letter in word{
            if let position = tempWord.firstIndex(of: letter){
                tempWord.remove(at: position)
            }else{
                return false
            }
        }
        
        return true
    }
    
    //check if this word was inserted
    func isOriginal(word: String) -> Bool{
        return !usedWords.contains(word)
    }
    
    //Check if the word can be spelled
    func isReal(word: String) -> Bool{
        
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
        
    }
    
    func isHardToCreate(word: String) -> Bool{
        if word.count < 3{
            return false
        }
        
        return true
    }
    
    //MARK - TableView Delegates
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "word", for: indexPath)
        
        cell.textLabel?.text = usedWords[indexPath.row]
        
        return cell
    
    }

    
    //MARK: - Error alert
    //Present an alert with the title and message
    func showAlertWithTitle(title:String ,andMessage message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }

}

