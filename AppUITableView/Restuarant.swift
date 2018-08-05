//
//  Restuarant.swift
//  AppUITableView
//
//  Created by Admin on 04.08.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class Restuarant {
    let name: String
    let type: String
    let location: String
    let image: String
    let isVisited: Bool
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
        
    }
    
    
    
}

