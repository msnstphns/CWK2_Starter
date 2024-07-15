//
//  PollutionView.swift
//  Coursework2
//
//  Created by GirishALukka on 30/12/2022.
//

import SwiftUI

struct PollutionView: View {
    
    @EnvironmentObject var modelData: ModelData
    //@EnvironmentObject var pollutionModel: PollutionModel
    @State var isSearchOpen: Bool = false
    @State  var userLocation: String = ""
    
    var body: some View {
        
        ZStack {
            Image("sky")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                // location
                Text(userLocation)
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                    .multilineTextAlignment(.center)
                
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.dt ?? 0))))
                    .formatted(.dateTime.year().hour().month().day()))
                .padding()
                .font(.largeTitle)
                .foregroundColor(.black)
                .shadow(color: .black, radius: 1)
                
                // weather description
                let currentWeatherDescription = modelData.forecast?.current.weather.first?.weatherDescription
                
                Text(" \(currentWeatherDescription!.rawValue.capitalized)")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                
                HStack {
                    // temperature
                    Image("temperature")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Temp: \((Int)(modelData.forecast!.current.temp))ºC")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                
                HStack {
                    // humidity
                    Image("humidity")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Humidity: \((Int)(modelData.forecast!.current.humidity))%")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                
                HStack {
                    // pressure
                    Image("pressure")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Pressure: \((Int)(modelData.forecast!.current.temp))hPa")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                
                HStack {
                    // wind speed
                    Image("windSpeed")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("WindSpeed: \((Int)(modelData.forecast!.current.windSpeed))mph")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                .padding(.bottom)
                
                VStack {
                    // air quality information
                    Text("Air Quality Data: ")
                        .bold()
                    
                    HStack {
                        // so2
                        VStack {
                            Image("so2")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("0")
                        }
                        
                        VStack {
                            // no
                            Image("no")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("0")
                        }
                        
                        VStack {
                            // voc
                            Image("voc")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("0")
                        }
                        
                        VStack {
                            // pm
                            Image("pm")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("0")
                        }
                    }
                }
            }
            .onAppear {
                Task.init {
                    self.userLocation = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
                }
            }
        }
    }
}

struct PollutionView_Previews: PreviewProvider {
    static var previews: some View {
        PollutionView().environmentObject(ModelData())
        //PollutionView().environmentObject(PollutionModel())
    }
}


