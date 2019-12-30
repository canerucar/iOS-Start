//
//  CurrentWeather.swift
//  Weather
//
//  Created by Caner Uçar on 15.11.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import Foundation

class CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    let icon: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    init(weatherDictionary: [String : Any])
    {
        //temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        
        if let temperatureDouble = weatherDictionary[WeatherKeys.temperature] as? Double {
            temperature = Int(temperatureDouble )
        }else{
            
            temperature = nil
        }
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
        icon = weatherDictionary[WeatherKeys.icon] as? String
    }
}
