//
//  Contact.swift
//  RealmDemo
//
//  Created by Vishal V Shekkar on 10/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
    
    dynamic var firstName = ""
    dynamic var lastName = ""
    dynamic var address = ""
    dynamic var age: Int16 = 0
    
    var fullNameFL: String {
        return firstName + " " + lastName
    }
    
    var fullNameLF: String {
        return lastName + " " + firstName
    }
}