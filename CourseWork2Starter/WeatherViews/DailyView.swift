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
    @EnvironmentObject var modelData: ModelData
    var day : Daily
   
    var body: some View {

        
        HStack {
            if let iconCode = day.weather.first?.icon {
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 40, height: 40)
            }
            Spacer()
            VStack {
                if let weatherDescription = day.weather.first?.weatherDescription.rawValue {
                    Text(weatherDescription.capitalized)
                } else {
                    Text("N/A")
                }
                
                Text(getFormattedDate(date: day.dt))
                
                
            }
            Spacer()
            Text("\(Int(day.temp.max))°C / \(Int(day.temp.min))°C")

           
        }.padding()
    }
    
}

struct DailyView_Previews: PreviewProvider {
    static var day = ModelData().forecast!.daily
    
    static var previews: some View {
        DailyView(day: day[0])
    }
}
