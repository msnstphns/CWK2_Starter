import SwiftUI

struct DailyView: View {
    
    @EnvironmentObject var modelData: ModelData
    var day : Daily
    
    var body: some View {
        
        HStack {
            // weather icon
            if let iconCode = day.weather.first?.icon {
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png")) { image in
                    image.resizable()
                } placeholder: {
                    Text("Icon loading...")
                }
                .frame(width: 40, height: 40)
            }
            Spacer()
            VStack {
                // weather description
                if let weatherDescription = day.weather.first?.weatherDescription.rawValue {
                    Text(weatherDescription.capitalized)
                } else {
                    Text("N/A")
                }
                // day and date
                Text(getFormattedDate(date: day.dt))
            }
            Spacer()
            // max and min temperature
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
