//
//  Constants.swift
//  WeatherApp
//
//  Created by Shweta Shrivastava on 1/17/21.
//

import Foundation

enum Constants {
    
    static func weather(city: String) -> String {
        "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=d340d8eb702f36dfb37f9b4c427bbb86&units=imperial"
    }
}
