//
//  Weather.swift
//  WeatherCombine
//
//  Created by Salihcan Kahya on 13.12.2020.
//

import Foundation


struct WeatherResponse: Decodable {
    let main : Weather
}

struct Weather: Decodable {
    let temp : Double?
    let humidity: Double?
    static var placeholder : Weather {
        return Weather(temp: nil, humidity: nil)
    }
}
