//
//  HourCondition.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct HourCondition: View {
    @EnvironmentObject var modelData: ModelData
    var current : Current
  
    
    var body: some View {


        HStack {
            Text(Date(timeIntervalSince1970: TimeInterval((Int(current.dt ?? 0))))
                .formatted(.dateTime.hour()))
            
            Text("\(Int(current.temp))°C")
            


            
                    if let weatherDescription = current.weather.first?.weatherDescription.rawValue {
                        Text(weatherDescription.capitalized)
                    } else {
                        Text("N/A")
                    }



                    Spacer()
                }.padding()
            }
        }

func formatDate(unixTimestamp: Int, format: String, timezone: String?) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    if let timezone = timezone {
        dateFormatter.timeZone = TimeZone(identifier: timezone)
    }
    return dateFormatter.string(from: date)
}


struct HourCondition_Previews: PreviewProvider {
    static var hourly = ModelData().forecast!.hourly
    
    static var previews: some View {
        HourCondition(current: hourly[0])
    }
}
