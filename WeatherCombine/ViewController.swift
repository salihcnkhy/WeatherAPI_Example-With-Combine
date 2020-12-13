//
//  ViewController.swift
//  WeatherCombine
//
//  Created by Salihcan Kahya on 13.12.2020.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var weatherSubcription : AnyCancellable?
    private let webservice : Webservice = Webservice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPublishers()
        
    }
    
    func setupPublishers() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object:  self.textField)
        
        self.weatherSubcription = publisher
            .compactMap { ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) }
            .debounce(for: .milliseconds(850), scheduler: RunLoop.main)
            .filter { [self] in
               if $0.isEmpty { tempLabel.text = ""}
               return !$0.isEmpty }
            .flatMap { city in
                return self.webservice.fetchWeather(city: city)
                    .catch({ _ in Just(Weather.placeholder)})
                    .map { $0 }
            }
            .map(\.temp)
            .map { $0 != nil ? "\($0!) ℃" : "Hatalı yer adı" }
            .assign(to: \.tempLabel.text, on: self)
        
        
    }


}

