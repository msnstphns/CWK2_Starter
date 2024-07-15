//
//  PollutionModel.swift
//  CourseWork2Starter
//
//  Created by Mason Stephens on 13/07/2024.
//

// http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=\(lat)&lon=\(lon)&appid=58f35e64b5d195a8b690f0a33cd39389

import Foundation

class PollutionModel: ObservableObject {
    
    @Published var pollution: Pollution?
    @Published var userLoc: String = ""

    func fetchPollutionData(lat: Double, lon: Double) async throws {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=\(lat)&lon=\(lon)&appid=58f35e64b5d195a8b690f0a33cd39389")
        let session = URLSession(configuration: .default)
        
        let (data, response) = try await session.data(from: url!)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("HTTP Response Status: \(httpResponse.statusCode)")
        }
        
        do {
            let pollutionData = try JSONDecoder().decode(Pollution.self, from: data)
            DispatchQueue.main.async {
                self.pollution = pollutionData
                print("Data successfully decoded and set to pollution property.")
            }
        } catch {
            print("Error decoding data: \(error)")
            throw error
        }
    }
}





