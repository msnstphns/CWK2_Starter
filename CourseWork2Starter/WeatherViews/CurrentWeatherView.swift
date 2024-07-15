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
    
    @State var userLocation: String = ""

    
    var body: some View {
        ZStack {
            Image("sky")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                

                VStack {
 
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
                            if let iconCode = modelData.forecast!.current.weather.first?.icon {
                                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView() // Show a progress view while loading the image
                                }
                                .frame(width:75, height: 75) // Adjust size as needed
                            }
                            Text(modelData.forecast!.current.weather[0].weatherDescription.rawValue.capitalized)
                                .foregroundColor(.black)
                        }
                        
                        HStack {
                            Text("High: \((Int)(modelData.forecast!.daily.first?.temp.max ?? 0))ºC")
                            
                            Text("Low: \((Int)(modelData.forecast!.daily.first?.temp.morn ?? 0))ºC")
                            
                        }
                        
                        VStack {
                            Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
                                .foregroundColor(.black)
                            
                        }
                        .padding(.top)
                        
                        
                        HStack {
                            Text("Wind Speed: \(Int(modelData.forecast!.current.windSpeed)) mph")


                            // use the WindDirHelper function to convert the wind direction from a number to the actual direction
                            Text("Direction: \(convertDegToCardinal(deg: Int(modelData.forecast!.current.windDeg)))")
                        }
                        .padding(.top)
                        
                        HStack {
                            Text("Humidity: \((Int)(modelData.forecast!.current.humidity))%")
                            
                            
                            Text("Pressure: \((Int)(modelData.forecast!.current.pressure)) hPg")
                            
                        }
                        .padding(.top)
                        
                        HStack {

                            Text("Sunset: \(formatUnixTime(Int(modelData.forecast!.daily.first?.sunset ?? 0)))")
                            

                            
                            Text("Sunrise: \(formatUnixTime(Int(modelData.forecast!.daily.first?.sunrise ?? 0)))")
                        }
                        .padding(.top)
                        
                    }.padding()
                }

            .foregroundColor(.black)
            .shadow(color: .black,  radius: 0.5)
            
            .onAppear {
                Task.init {
                    self.userLocation = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
                }
            }
        }.ignoresSafeArea(edges: [.top, .trailing, .leading])
    }
}

struct Conditions_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
            .environmentObject(ModelData())
    }
}
