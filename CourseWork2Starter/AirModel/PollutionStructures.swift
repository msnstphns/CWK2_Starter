//
//  PollutionStructures.swift
//  CourseWork2Starter
//
//  Created by Mason Stephens on 01/07/2024.
//


import Foundation

// MARK: - Welcome
struct Pollution: Codable {
    let coord: Coord
    let list: [PollutionData]
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double // Using Double for coordinates
}

// MARK: - PollutionData
struct PollutionData: Codable {
    let main: MainData
    let components: [String: Double]
    let dt: Int
}

// MARK: - MainData
struct MainData: Codable {
    let aqi: Int // Air Quality Index
}
