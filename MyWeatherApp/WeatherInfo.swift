//
//  WeatherInfo.swift
//  MyWeatherApp
//
//  Created by Brian J Glowe on 1/18/16.
//  Copyright © 2016 Brian Glowe. All rights reserved.
//

import Foundation

struct WeatherInfo {
    
    let temperature: Int?
  //  let summary: String?
    
    init(weatherDictionary: [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as? Int
       // summary = weatherDictionary["summary"] as? String
    }
}