//
//  APIKeys.swift
//  MyWeatherApp
//
//  Created by Brian J Glowe on 1/26/16.
//  Copyright © 2016 Brian Glowe. All rights reserved.
//

import Foundation

func valueForAPIKey(keyname keyname:String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource("APIKeys", ofType:"plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    
    let value:String = plist?.objectForKey(keyname) as! String
    return value
}