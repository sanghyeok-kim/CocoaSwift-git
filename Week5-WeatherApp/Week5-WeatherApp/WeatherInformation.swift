//
//  WeatherInformation.swift
//  Week5-WeatherApp
//
//  Created by 김상혁 on 2021/11/29.
//

import Foundation

struct WeatherInformation: Codable {
    let weather: [Weather]
    let main: Temp
    let timezone: Int
    let name: String
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}

