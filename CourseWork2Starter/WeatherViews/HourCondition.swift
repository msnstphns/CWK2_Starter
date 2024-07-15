import SwiftUI

struct HourCondition: View {
    @EnvironmentObject var modelData: ModelData
    var current : Current
    
    
    var body: some View {
        
        ZStack {
            
            /*Image("background 1")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)*/
            HStack {
                VStack {
                    Text(Date(timeIntervalSince1970: TimeInterval((Int(current.dt ))))
                        .formatted(.dateTime.hour()))
                    
                    Text(Date(timeIntervalSince1970: TimeInterval((Int(current.dt ))))
                        .formatted(.dateTime.weekday(.abbreviated)))
                }
                
                if let iconCode = current.weather.first?.icon {
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png")) { image in
                        image.resizable()
                    } placeholder: {
                        Text("Loading image...")
                    }
                    .frame(width:75, height: 75)
                }
                
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
