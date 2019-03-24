//
//  ViewController.swift
//  Project6b
//
//  Created by Flavio Costa on 25/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Create five labels with different colors and text
        //translatesAutoresizingMaskIntoConstraints: Don't translate it to auto layout constraint
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = .red
        label1.text = "THESE"
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .orange
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = .yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = .green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = .cyan
        label5.text = "LABELS"
        label5.sizeToFit()
        
        //Add these views in the main view
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        
        //STEPS TO USE A TECHNIQUE CALLED VISUAL FORMAT LANGUAGE (VFL), A WAY OF DRAWING LAYOUT USING KEYBOARD SYMBOLS
        
        //1 - Create a dictionary with these 5 labels
        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
        //2.1 - Horizontal Constraints: Add an array of constraints to the main view: view.addConstraints
        //2.2 - Horizontal Constraints: Auto Layout method that converts VFL into an array of constraints: NSLayoutConstraint.constraints(withVisualFormat:)
        for label in viewsDictionary.keys{
            
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
           
            //Breaking this code:
            //H: -> Horizontal Layout
            //| -> The edge of the view view Controller
            // [label] -> Tell to the VFL which label will be in this view space
            
        }
        
        
        //2.3 - add a label height metric dictionary
        //2.4 - Vertical Constraints: Add an array of constraints to the main view: view.addConstraints
        //2.5 - Vertical Constraints: Auto Layout method that converts VFL into an array of constraints: NSLayoutConstraint.constraints(withVisualFormat:)
        let metrics = ["labelHeight": 88]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]->=10-|", options: [], metrics: metrics, views: viewsDictionary))
        //Breaking this code:
        //V: -> Vertical Layout
        //| -> The edge of the view view Controller
        // [label] -> Tell to the VFL which label will be in this view space
        // - -> Space between the labels (10 points)
        //@999 is the priority of the constraint. Constraint priority is a value between 1 to 1000, where 1000 is "this is absolutely required". 999 is very important but not required and the height of the label will be adjustable. the first label has the labelHeight 88 and priority 999. All the others have the same by referencing label1.
    }


}

