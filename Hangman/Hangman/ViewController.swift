//
//  ViewController.swift
//  Hangman
//
//  Created by Flavio Costa on 31/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLife1: UIImageView!
    @IBOutlet weak var imgLife2: UIImageView!
    @IBOutlet weak var imgLife3: UIImageView!
    @IBOutlet weak var imgLife4: UIImageView!
    @IBOutlet weak var imgLife5: UIImageView!
    @IBOutlet weak var imgLife6: UIImageView!
    @IBOutlet weak var imgLife7: UIImageView!
    @IBOutlet weak var imgLife8: UIImageView!
    @IBOutlet weak var imgLife9: UIImageView!
    @IBOutlet weak var imgLife10: UIImageView!
    
    @IBOutlet var lblWord: UILabel!
    
    @IBOutlet var lblNumberOfLetters: UILabel!
    
    @IBOutlet var lblChosenLetters: UILabel!
    
    @IBOutlet var txtLetter: UITextField!
    
    @IBOutlet var lblTotalWordsGuessed: UILabel!
    
    
    var lifeStatusImages: [UIImageView]!
    var numberOfLifes = 10
    var words: [String]!
    var currentLetter: String!
    var currentWord: String!
    var showedWord = [String]()
    var currentAnswer = [String]()
    var isLastLife = false
    var numberOfWordGuessed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lifeStatusImages = [imgLife1,imgLife2,imgLife3,imgLife4,imgLife5,imgLife6,imgLife7,imgLife8,imgLife9,imgLife10]
        
        loadWords()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(restartGame))
        
        title = "TRY TO GUESS THE WORD"
    }
    
    /// Load the words from a file and add these words in the words array
    @objc func loadWords(){
   
        if let file = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let wordsContent = try? String(contentsOf: file){
                words = wordsContent.components(separatedBy: "\n")
                prepareToStart()
            }
        }
        
    }
    
    
    /// Update the UI for a new word
    @objc func prepareToStart(){
        
        if let allWords = words{
            if allWords.count > 1{
                words.shuffle()
                showNewWord(wordPosition: numberOfWordGuessed)
            }
        }
    }
    
    
    /// Show new word
    ///
    /// - Parameter wordPosition: word position in the words array
    func showNewWord(wordPosition: Int){
        
        if words.count>1{
            currentAnswer.removeAll()
            lblChosenLetters.text = ""
            currentWord = words[wordPosition]
            for _ in currentWord{
                currentAnswer.append("? ")
            }
            let numberOfLetters = currentWord.count
            lblNumberOfLetters.text = "\(numberOfLetters) Letters"
            lblWord.text = currentAnswer.joined(separator: "")
        }
        
    }
    
    
    /// Check if the current word has the letter typed
    ///
    /// - Parameter userLetter: letter typed
    func checkIfTheWordHasTheLetter(userLetter: String){
    
        if currentWord.contains(userLetter){
            for (index, value) in currentWord.enumerated(){
                if "\(value)" == userLetter{
                    currentAnswer[index] = userLetter
                }
            }
            lblWord.text = currentAnswer.joined(separator: "").uppercased()
            checkIfTheWordWasGuessed()
        }else{
            removeOneLife()
        }
        
    }
    
    
    /// Check if the word typed is correct
    ///
    /// - Parameter word: typed word
    func checkFullWord(word: String){
        
        if currentWord == word{
            wordWasGuessed()
        }else{
            removeOneLife()
        }
        
    }
    
    /// Remove one user life and change the image of the last life images array
    @objc func removeOneLife(){
        
        if numberOfLifes >= 1 {
            numberOfLifes -= 1
            lifeStatusImages[numberOfLifes].image = UIImage(named: "heart_outline")
            
            if numberOfLifes == 1{
                isLastLife = true
                showAlert(title: "Last life", message: "This is your last life. You can guess all the word.")
            }else if(numberOfLifes == 0){
                showAlert(title: "You lost!", message: "The word \(currentWord.uppercased()) wasn't guessed. You guessed \(numberOfWordGuessed) words and the game will restart")
                restartGame()
            }
        }
        
    }
    
    func getOneLife(){
        lifeStatusImages[numberOfLifes].image = UIImage(named: "heart_filled")
        numberOfLifes += 1
        isLastLife = false
    }
    
    
    /// Update the word. If the word was guessed, show an alert and get a new word
    @objc func checkIfTheWordWasGuessed(){
        
        if !lblWord.text!.contains("?"){
            wordWasGuessed()
        }
    }
    
    func wordWasGuessed(){
        showAlert(title: "Wow!", message: "The word \(currentWord.uppercased()) was guessed. Time for another one.")
        showNewWord(wordPosition: numberOfWordGuessed+1)
        if numberOfLifes<10{
            getOneLife()
        }
        numberOfWordGuessed += 1
        lblTotalWordsGuessed.text = "Total of words guessed: \(numberOfWordGuessed)"
    }
    
    @objc func restartGame(){
    
        lblChosenLetters.text = ""
        numberOfLifes = 10
        currentAnswer.removeAll()
        isLastLife = false
        numberOfWordGuessed = 0
        lblTotalWordsGuessed.text = "Total of words guessed: 0"
        
        for image in lifeStatusImages{
            image.image = UIImage(named: "heart_filled")
        }
        loadWords()
        
    }
    // MARK: Alert
    func showAlert(title:String,message:String){
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true)
        
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate{
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if isLastLife || textField.text?.count == 0{
           return true
        }else{
           return false
        }
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        currentLetter = textField.text?.lowercased()
        
        if isLastLife {
            checkFullWord(word: txtLetter.text!.lowercased())
        }else{
            lblChosenLetters.text?.append("\(currentLetter.uppercased())  ")
            checkIfTheWordHasTheLetter(userLetter: currentLetter)
        }
        
        txtLetter.text = ""
        
        return true
    }
    
}
