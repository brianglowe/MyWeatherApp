//
//  NetworkOperation.swift
//  MyWeatherApp
//
//  Created by Brian J Glowe on 1/18/16.
//  Copyright © 2016 Brian Glowe. All rights reserved.
//

import Foundation

class NetworkOperation {
    
    // Review doc's for this URL session config
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void
    
    init(url: NSURL) {
        self.queryURL = url
    }
    
    func getJSONFromURL(completion: JSONDictionaryCompletion) {
        
        let request: NSURLRequest = NSURLRequest(URL: queryURL)

        // Watch Treehouse video on Closures
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
    
                if let httpResponse = response as? NSHTTPURLResponse {
                
                    switch(httpResponse.statusCode) {
                    case 200:
                        do {
                            let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [String: AnyObject]
                            completion(jsonDictionary)
                        } catch let error {
                            print("Could not serialize JSON due to error: \(error)")
                        }
                    default:
                        print("Server request failed with code: \(httpResponse.statusCode)")
                    }
                } else {
                    print("Error: Not a valid HTTP Response")
            }
        }
        dataTask.resume()
    }
    
}
