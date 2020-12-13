//
//  Webservice.swift
//  WeatherCombine
//
//  Created by Salihcan Kahya on 13.12.2020.
//

import Foundation
import Combine

class Webservice {
    
    func fetchWeather(city: String ) -> AnyPublisher<Weather, Error> {
        guard let url = URL(string: Constants.URLs.weather(city: city)) else { fatalError("Invalid URL") }
        print("City Name: \(city)")
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map(\.main)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
