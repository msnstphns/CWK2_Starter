import SwiftUI

struct HourCondition: View {
    @EnvironmentObject var modelData: ModelData
    var current : Current
    
    
    var body: some View {
        
        ZStack {
            /*Image("sky")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)*/
            HStack {
                VStack {
                    // time and then day underneath
                    Text(Date(timeIntervalSince1970: TimeInterval((Int(current.dt ))))
                        .formatted(.dateTime.hour()))
                    
                    Text(Date(timeIntervalSince1970: TimeInterval((Int(current.dt ))))
                        .formatted(.dateTime.weekday(.abbreviated)))
                }
                
                // weather icon
                if let iconCode = current.weather.first?.icon {
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png")) { image in
                        image.resizable()
                    } placeholder: {
                        Text("Loading image...")
                    }
                    .frame(width:75, height: 75)
                }
                
                // current temperature
                Text("\(Int(current.temp))°C")

                // current weather description
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

struct HourCondition_Previews: PreviewProvider {
    static var hourly = ModelData().forecast!.hourly
    
    static var previews: some View {
        HourCondition(current: hourly[0])
    }
}
