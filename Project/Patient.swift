//
//  Patient.swift
//  Project
//
//  Created by Dishant Patel on 2020-04-05.
//  Copyright © 2020 Dishant Patel. All rights reserved.
//

import Foundation

class Patient {
   
    var name:String = ""
    var age:Int = 0
    var hasTravelled:Bool = false
    var priorityLevel:Int = 0
    
    init() {
    }
    
    init(name:String, age:Int, hasTravelled:Bool, priorityLevel:Int) {
        self.name = name
        self.age = age
        self.hasTravelled = hasTravelled
        self.priorityLevel = priorityLevel
    }
    
}
