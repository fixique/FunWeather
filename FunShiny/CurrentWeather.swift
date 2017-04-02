//
//  CurrentWeather.swift
//  FunShiny
//
//  Created by Vlad Krupenko on 19.03.17.
//  Copyright © 2017 fixique. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String! = ""
    var _date: String! = ""
    var _weatherType: String! = ""
    var _currentTemp: Double! = 1.0
    
    var cityName: String {
        get {
            if _cityName == nil {
                return ""
            }
            
            return _cityName
        }
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        // Alamofire download 
        
//        let currentWeatherUrl = URL(string: CURRENT_WEATHER_URL)
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let kelvinToCelsius = (currentTemperature - 273.15)
                        
                        self._currentTemp = kelvinToCelsius
                        
                        print(Int(self._currentTemp))
                    }
                }
            }
            completed()

        }
        
        
        
    }
    
    
}





























