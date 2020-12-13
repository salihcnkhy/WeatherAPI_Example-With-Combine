//
//  Constants.swift
//  WeatherCombine
//
//  Created by Salihcan Kahya on 13.12.2020.
//

import Foundation


struct Constants {
    
    struct URLs {
        
        static func weather(city: String) -> String {
            "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&APPID=175873dd9852eddfadb307231f045c94"
        }
    }
    
}
