//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Brian J Glowe on 1/18/16.
//  Copyright © 2016 Brian Glowe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    
    private let forecastAPIKey = "16be9632358a25f6b91cfbba418cf626"
    let coordinates: (lat: Double, long: Double) = (42.3314, -83.0458)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinates.lat, long: coordinates.long) {
            (let currently) in
            if let currentWeather = currently {
                dispatch_async(dispatch_get_main_queue()) {
                    if let temperature = currentWeather.temperature {
                        self.temperatureLabel?.text = "\(temperature)º"
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

