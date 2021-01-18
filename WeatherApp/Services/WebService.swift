//
//  WebService.swift
//  WeatherApp
//
//  Created by Shweta Shrivastava on 1/17/21.
//

import Foundation
import Combine

class WebService {
    func fetchWeather(for city: String) -> AnyPublisher<Weather, Error> {
        guard let url = URL(string: Constants.weather(city: city)) else {
            fatalError("Invalid Error")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

