//
//  ViewController.swift
//  WeatherApp
//
//  Created by Shweta Shrivastava on 1/17/21.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var city: UITextField!

    private let webService = WebService()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupPublisher()
    }

    private func setupPublisher() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.city)
       
        self.cancellable = publisher
            .compactMap {
                ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            }.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .flatMap { (city) in
                return self.webService.fetchWeather(for: city)
                    .catch { _ in Just(Weather.placeHiolder) }
                    .map { $0 }
            }
            .sink {
                if let temp = $0.temp {
                    self.temperatureLabel.text = "\(temp) ºF"
                } else {
                    self.temperatureLabel.text = ""
                }
            }
        
    }
}

