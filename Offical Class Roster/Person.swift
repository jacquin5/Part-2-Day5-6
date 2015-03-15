//
//  Person.swift
//  Offical Class Roster
//
//  Created by Jacquin Wynn Jr on 3/3/15.
//  Copyright (c) 2015 JMW. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
    
    //Declare properties
    var firstName = "John"
    var lastName = "Doe"
    var image : UIImage?
    
    
    init(firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    //Need this for NSCoding (BoilerPlate)
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        if let image = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = image
        }
    }
    //Need this for NSCoding Protocol (BoilerPlate)
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        if image != nil {
            aCoder.encodeObject(self.image, forKey: "image")
        }
    }
    
    
}