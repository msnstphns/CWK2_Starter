//
//  DailyView.swift
//  Coursework2
//
//  Created by G Lukka.
//

/*
 List(forecastListVM.forecasts, id: \.day) { day in
         VStack(alignment: .leading) {
             Text(day.day)
                 .fontWeight(.bold)
             HStack(alignment: .center) {
                 WebImage(url: day.weatherIconURL)
                     .resizable()
                     .placeholder {
                         Image(systemName: "hourglass")
                     }
                     .scaledToFit()
                     .frame(width: 75)
                 VStack(alignment: .leading) {
                     Text(day.overview)
                         .font(.title2)
                     HStack {
                         Text(day.high)
                         Text(day.low)
                     }
                     HStack {
                         Text(day.clouds)
                         Text(day.pop)
                     }
                     Text(day.humidity)
                 }
             }
         }
     }
 */

import SwiftUI

struct DailyView: View {
    var day : Daily
   
    var body: some View {
        
        
        HStack {
            Text("Weather icon")
            Spacer()
            VStack {
                Text("Weather description")
                
                Text("Day and 2 digit date")
                
            }
            Spacer()
            Text("high temp and low temp")
           
        }.padding()
    }
    
}

struct DailyView_Previews: PreviewProvider {
    static var day = ModelData().forecast!.daily
    
    static var previews: some View {
        DailyView(day: day[0])
    }
}
