//
//  Person.swift
//  Offical Class Roster
//
//  Created by Jacquin Wynn Jr on 3/3/15.
//  Copyright (c) 2015 JMW. All rights reserved.
//

import UIKit

class Person {
    
    //Declare properties
    var firstName = "John"
    var lastName = "Doe"
    var image : UIImage?
    
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    
}