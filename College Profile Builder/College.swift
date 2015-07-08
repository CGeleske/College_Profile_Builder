//
//  College.swift
//  College Profile Builder
//
//  Created by Christopher Geleske on 7/6/15.
//  Copyright © 2015 Christopher Geleske. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name = ""
    var state = "denial"
    var population = 0
    var image = UIImage(named: "Default")
    
    convenience init(name : String, state : String, population : Int, image: UIImage){
        self.init()
        self.name = name
        self.state = state
        self.population = population
        self.image = image
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
        
    }

}
