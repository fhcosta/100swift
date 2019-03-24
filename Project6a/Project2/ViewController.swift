//
//  ViewController.swift
//  Project2
//
//  Created by Flavio Costa on 04/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var counter = 0
    var lblScore = UILabel()
    
    
    /// Apply some UI settings in the Buttons, create an array with countries names strings and start a new game
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        newGame()
        
    }
    
    
    /// Start a new game. Remove the final result label from super view, set score and counter to 0, start creating questions calling the askQuestion() and finally show the flags.
    func newGame(){
        
        lblScore.removeFromSuperview()
        score = 0
        counter = 0
        askQuestion()
        hideFlags(show: false)
    }
    
    
    /// Main class method. This method shuffle the countries array and set a correct answer
    /// value. Set the 3 button images from the shuffled countries array and the screen title
    /// with the correct answer value
    /// - Parameter action: UIAlertAction response or nothing
    func askQuestion(action: UIAlertAction! = nil){
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
 
        self.title = countries[correctAnswer].uppercased()
        
    }
    
    
    /// Start a new game
    ///
    /// - Parameter sender: UIBarButtonItem from NavigationBar in Storyboard
    @IBAction func didSelectNewGame(_ sender: Any) {
        
        newGame()
        
    }
    
    
    /// When the user select a flag, check if the answer is correct or not
    /// While the counter is less than 10, keep showing the alert with the current answer result. If the counter is more than 10 call showFinalResult()
    /// - Parameter sender: UIButton from Storyboard
    @IBAction func didSelectFlag(_ sender: UIButton) {
        
        counter += 1
        
        var statusAnswer: String!
        
        if correctAnswer == sender.tag {
           score += 1
            statusAnswer = "Correct"
        }else{
            score -= 1
            statusAnswer = "Wrong, correct is \(countries[correctAnswer].uppercased())"
        }
        
        if counter < 10{
        
            let alert = UIAlertController.init(title: statusAnswer, message: "Your score is \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Continue", style: .default, handler: askQuestion))
            present(alert, animated: true)
        }else{
            
            self.title = "End Game"
            showFinalResult()
            
        }
        
    }
    
    
    /// Hide all Flags(Buttons)
    ///
    /// - Parameter show: Boolean value which will set the buttons visibility status
    func hideFlags(show: Bool){
        
        button1.isHidden = show
        button2.isHidden = show
        button3.isHidden = show
        
    }
    
    
    /// Show the final result in a label and hide the others UI elements
    func showFinalResult(){
        
        hideFlags(show: true)
        lblScore.text = "Final Score: \(score)"
        lblScore.frame = view.frame
        lblScore.textAlignment = .center
        view.addSubview(lblScore)
        
    }
}

