//
//  animal.swift
//  Cat-Dog-App
//
//  Created by Mehdi Benrefad on 11/04/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import Foundation

//let dog = animal(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)

class animal{
    
    var name = String()
    var hasMajority = Bool()
    var phone = String()
    var race = String()
    var gender = String()
    
    init(_ name: String,_ hasMajority: Bool,_ phone: String,_ race: String,_ gender: String){
        self.name=name
        self.hasMajority=hasMajority
        self.phone=phone
        self.race=race
        self.gender=gender
    }
}
