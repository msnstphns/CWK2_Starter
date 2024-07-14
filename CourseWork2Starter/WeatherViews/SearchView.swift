//
//  SearchView.swift
//  CWK2_23_GL
//
//  Created by GirishALukka on 11/03/2023.
//

import SwiftUI
import CoreLocation

struct SearchView: View {
    
    @EnvironmentObject var modelData: ModelData
    @Binding var isSearchOpen: Bool
    @State private var location = ""
    @Binding var userLocation: String
    @State private var errorMessage: String?

    var body: some View {
        Spacer()
        ZStack {
            Color.teal
                .ignoresSafeArea()
            
            VStack {
                Text("Enter a new location to fetch weather data. Press return/enter to confirm.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                TextField("Enter New Location", text: $location, onCommit: {
                    geocodeLocation()
                })
                .padding(10)
                .shadow(color: .blue, radius: 10)
                .cornerRadius(10)
                .font(.custom("Ariel", size: 26))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .padding()
        }
        Spacer()
    }
    
    private func geocodeLocation() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                self.errorMessage = "Error: \(error.localizedDescription)"
                return
            }
            
            guard let placemark = placemarks?.first,
                  let latitude = placemark.location?.coordinate.latitude,
                  let longitude = placemark.location?.coordinate.longitude else {
                self.errorMessage = "Location not found."
                return
            }
            
            // update user location and fetch weather data
            userLocation = "\(latitude), \(longitude)"
            Task {
                do {
                    try await modelData.loadData(lat: latitude, lon: longitude)
                    isSearchOpen.toggle()
                } catch {
                    self.errorMessage = "Failed to load weather data: \(error.localizedDescription)"
                }
            }
        }
    }
}
