//
//  PollutionModel.swift
//  CourseWork2Starter
//
//  Created by Mason Stephens on 13/07/2024.
//

// http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=\(lat)&lon=\(lon)&appid=58f35e64b5d195a8b690f0a33cd39389

/*    @Published var forecast: Forecast?
 @Published  var userLocation: String = ""
 init() {
     self.forecast = load("london.json")
 }
 

 func loadData(lat: Double, lon: Double) async throws -> Forecast {
     let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&units=metric&appid=58f35e64b5d195a8b690f0a33cd39389")
     let session = URLSession(configuration: .default)
     
     let (data, _) = try await session.data(from: url!)
     
     do {
         //print(data)
         let forecastData = try JSONDecoder().decode(Forecast.self, from: data)
         DispatchQueue.main.async {
             self.forecast = forecastData
         }
         
         return forecastData
     } catch {
         throw error
     }
 }*/

import Foundation

class PollutionModel: ObservableObject {
    
    @Published var pollution: Pollution?
    @Published  var userLoc: String = ""


    
    func fetchPollutionData(lat: Double, lon: Double) async throws -> Pollution {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=\(lat)&lon=\(lon)&appid=58f35e64b5d195a8b690f0a33cd39389")
        let session = URLSession(configuration: .default)
        
        let (data, _) = try await session.data(from: url!)
        
        do {
            let pollutionData = try JSONDecoder().decode(Pollution.self, from: data)
            DispatchQueue.main.async {
                self.pollution = pollutionData
            }
            
            return pollutionData
        } catch {
            throw error
        }
    }

    
}



