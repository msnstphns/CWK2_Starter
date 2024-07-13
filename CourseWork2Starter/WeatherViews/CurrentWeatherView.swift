//
//  Conditions.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct CurrentWeatherView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var locationString: String = "No location"
    @State  var userLocation: String = ""
    
    var body: some View {
        ZStack {
            Image("sky")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                

                VStack {

        //          Temperature Info
                    VStack {
                        Text("\((Int)(modelData.forecast!.current.temp))ºC")
                            .padding()
                            .font(.largeTitle)
                        HStack {

                            Text(modelData.forecast!.current.weather[0].weatherDescription.rawValue.capitalized)
                                .foregroundColor(.black)
                        }
                        
                        /*                let currentWeatherDescription = modelData.forecast?.current.weather.first?.weatherDescription
                         
                         Text(" \(currentWeatherDescription!.rawValue.capitalized)")
                                             .padding()
                                             .font(.title2)
                                             .foregroundColor(.black)
                                             .shadow(color: .black, radius: 0.5)*/
                        
                        
                        // let dailyForecast = modelData.forecast?.daily.temp.max
                        
                        HStack {
                            Text("H: \((Int)(modelData.forecast!.daily.temp.max))")
                        }

                        Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
                            .foregroundColor(.black)
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
