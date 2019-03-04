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
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var btnNewGame: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var counter = 0
    
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
    
    func newGame(){
        
        lblScore.text = "Current Score: 0"
        score = 0
        counter = 0
        askQuestion()
        showFlags(show: false)
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
 
        self.title = countries[correctAnswer].uppercased()
        
    }
    @IBAction func didSelectNewGame(_ sender: Any) {
        
        newGame()
        
    }
    
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
        
        if counter <= 10{
        
            let alert = UIAlertController.init(title: statusAnswer, message: "Your score is \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Continue", style: .default, handler: askQuestion))
            present(alert, animated: true)
            lblScore.text = "Current Score: \(score)"
        }else{
            
            self.title = "End Game"
            showFlags(show: true)
            lblScore.text = "Final Score: \(score)"
            
        }
        
    }
    
    func showFlags(show: Bool){
        
        btnNewGame.isHidden = !show
        button1.isHidden = show
        button2.isHidden = show
        button3.isHidden = show
        
    }
}

