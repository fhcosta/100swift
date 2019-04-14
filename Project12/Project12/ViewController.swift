//
//  ViewController.swift
//  Project12
//
//  Created by Flavio Costa on 09/04/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting
        let defaults = UserDefaults.standard
        
        //Writing
        defaults.set("Flavio",forKey:"name")
        defaults.set(30, forKey: "age")
        defaults.set(Date(),forKey:"lastOpen")
        
        let visitedCountries = ["Brazil","Mexico","Argentina","United States","Portugal","Barcelona","New Zealand"]
        
        defaults.set(visitedCountries, forKey: "visitedCountries")
        
        //Reading
        
        let name = defaults.value(forKey: "name") as? String ?? ""
        let countries = defaults.object(forKey: "visitedCountries") as? [String] ?? [String]()
        let lastOpen = defaults.value(forKey: "lastOpen") as? Date ?? Date()
        
        print("\(name) visited \(countries.count) countries and open the app at \(lastOpen)")
        
    }


}

