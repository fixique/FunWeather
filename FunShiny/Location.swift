//
//  Location.swift
//  FunShiny
//
//  Created by Vlad Krupenko on 20.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//

import UIKit
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
