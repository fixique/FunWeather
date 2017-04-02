//
//  Constants.swift
//  FunShiny
//
//  Created by Vlad Krupenko on 19.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "96b1feaf76d8871ebfaf1ca77736a4c5"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=96b1feaf76d8871ebfaf1ca77736a4c5"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=96b1feaf76d8871ebfaf1ca77736a4c5"
