//
//  Petition.swift
//  Project7
//
//  Created by Flavio Costa on 26/03/19.
//  Copyright © 2019 cappsule. All rights reserved.
//

import Foundation

//Create a object extendind Codable
struct Petition: Codable{
    
    var title: String
    var body: String
    var signatureCount: Int
    
}
