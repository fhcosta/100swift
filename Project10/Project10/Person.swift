//
//  Person.swift
//  Project10
//
//  Created by Flavio Costa on 02/04/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
