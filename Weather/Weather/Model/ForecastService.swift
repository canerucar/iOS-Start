//
//  ForecastService.swift
//  Weather
//
//  Created by Caner Uçar on 15.11.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import Foundation
import Alamofire

class ForecastService
{
    // Sample url: https://api.darksky.net/forecast/e7c3884747a119b8c9b9365621abaa13/37.8267,-122.4233
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String)
    {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getCurrentWeather(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void)
    {
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)") {
            
            Alamofire.request(forecastURL).responseJSON(completionHandler: { (response) in
                if let jsonDictionary = response.result.value as? [String : Any] {
                    if let currentWeatherDictionary = jsonDictionary["currently"] as? [String : Any] {
                        let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                        completion(currentWeather)
                    } else {
                        completion(nil)
                    }
                    
                }
            })
        }
        
    }
    
}

