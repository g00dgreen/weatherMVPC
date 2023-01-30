//
//  NetworkService.swift
//  mvp+c
//
//  Created by Артем Макар on 27.01.23.
//

import Foundation
protocol NetworkServiceProtocol {
    func getWeather(latitude: Double, longitude: Double, completion: @escaping (WetherData) -> Void)
}
class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    func getWeather(latitude: Double, longitude: Double, completion: @escaping (WetherData) -> Void) {
        let urlString = "https://api.open-meteo.com/v1/dwd-icon?latitude=\(latitude)&longitude=\(longitude)&hourly=temperature_2m,windspeed_10m&timezone=Europe%2FMoscow"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { print(9)
                return }
            if let wetherData = try? JSONDecoder().decode(WetherData.self, from: data) {
                print("success")
                completion(wetherData)
            } else {
                print("request fail")
            }
        }
        task.resume()
    }
}
