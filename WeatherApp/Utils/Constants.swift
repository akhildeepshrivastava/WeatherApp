//
//  Constants.swift
//  WeatherApp
//
//  Created by Shweta Shrivastava on 1/17/21.
//

import Foundation
enum Constants {
    
    static func weather(city: String, token: String) -> String {
        "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(token)&units=imperial"
    }
}
