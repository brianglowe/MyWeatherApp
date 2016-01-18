//
//  ForecastService.swift
//  MyWeatherApp
//
//  Created by Brian J Glowe on 1/18/16.
//  Copyright © 2016 Brian Glowe. All rights reserved.
//

import Foundation

class ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    init(APIKey: String) {
        forecastAPIKey = APIKey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    func getForecast(lat: Double, long: Double, completion: (WeatherInfo? -> Void)) {
        
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL) {
            
            let networkOperation = NetworkOperation(url: forecastURL)
            networkOperation.getJSONFromURL {
                (let jsonDictionary) in
                let currentWeather = self.currentWeatherFromJSON(JSONDictionary)
                completion(currentWeather)
            }
        } else {
            print("Could not construct valid URL")
        }
    }

    func currentWeatherFromJSON(jsonDictionary: [String: AnyObject]?) -> WeatherInfo? {
        if let currentWeatherDictionary = jsonDictionary!["currently"] as? [String: AnyObject] {
            return WeatherInfo(weatherDictionary: currentWeatherDictionary)
        } else {
            print("'currently' key not found")
            return nil
        }
        
    }
    
    
    
}




