//
//  Weather.swift
//  WeatherApp
//
//  Created by Shweta Shrivastava on 1/17/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double?
    let humidity: Double?
    
    static var placeHiolder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
}
