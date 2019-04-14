//
//  Person.swift
//  Project10
//
//  Created by Flavio Costa on 02/04/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {

    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    
    /// Decode the objects archived in the disk
    ///
    /// - Parameter aDecoder: The object to unarchive values from the archiving
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
    }
    
    
    /// Encode objects in to the system archive
    ///
    /// - Parameter aCoder: The object to archive data in the hard disk
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey:"name")
        aCoder.encode(image, forKey:"image")
    }
    

    
}
