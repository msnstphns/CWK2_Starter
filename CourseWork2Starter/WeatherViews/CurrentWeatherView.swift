//
//  Conditions.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI
import CoreLocation

struct CurrentWeatherView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var locationString: String = "No location"
    @State var userLocation: String = "London?"
    
    var body: some View {
        ZStack {
            Image("sky")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                

                VStack {

        //          Temperature Info
                    VStack {
                        Text(userLocation)
                            .font(.title)
                            .foregroundColor(.black)
                            .shadow(color: .black, radius: 0.5)
                            .multilineTextAlignment(.center)
                        
                        Text("\((Int)(modelData.forecast!.current.temp))ºC")
                            .padding()
                            .font(.largeTitle)
                        HStack {

                            Text(modelData.forecast!.current.weather[0].weatherDescription.rawValue.capitalized)
                                .foregroundColor(.black)
                        }
                        
                        HStack {
                            Text("H: \((Int)(modelData.forecast!.daily.first?.temp.max ?? 0))")
                            
                            Text("L: \((Int)(modelData.forecast!.daily.first?.temp.morn ?? 0))")
                        }

                        Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
                            .foregroundColor(.black)
                        
                        HStack {
                            Text("Wind Speed: \((Double)(modelData.forecast!.current.windSpeed))")
                            
                            Text("Direction: \((Int)(modelData.forecast!.current.windDeg))")
                        }
                        
                        HStack {
                            Text("Humidity: \((Int)(modelData.forecast!.current.humidity))")
                            
                            
                            Text("Pressure: \((Int)(modelData.forecast!.current.pressure))")
                            
                        }
                        
                        HStack {
                            Text("Sunset\((Int)(modelData.forecast!.daily.first?.sunset ?? 0))")
                            
                            Text("Sunrise\((Int)(modelData.forecast!.daily.first?.sunrise ?? 0))")
                        }
                        
                    }.padding()
                }

            .foregroundColor(.black)
            .shadow(color: .black,  radius: 0.5)
            
        }.ignoresSafeArea(edges: [.top, .trailing, .leading])
    }
}

struct Conditions_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
            .environmentObject(ModelData())
    }
}
