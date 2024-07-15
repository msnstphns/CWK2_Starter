import SwiftUI
import CoreLocation

struct Home: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var isSearchOpen: Bool = false
    @State  var userLocation: String = ""
    
    
    var body: some View {
        ZStack {
            Image("sky")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                //Spacer()
                HStack {
                    Spacer()
                    
                    Button {
                        self.isSearchOpen.toggle()
                    } label: {
                        Text("Change Location")
                            .bold()
                            .font(.system(size: 30))
                    }
                    .sheet(isPresented: $isSearchOpen) {
                        SearchView(isSearchOpen: $isSearchOpen, userLocation: $userLocation)
                    }
                    .padding()
                    
                    Spacer()
                }
                
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
                
                HStack {
                    if let iconCode = modelData.forecast?.current.weather.first?.icon {
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png")) { image in
                            image.resizable()
                        } placeholder: {
                            Text("Loading image...")
                        }
                        .frame(width:75, height: 75)
                    }
                    let currentWeatherDescription = modelData.forecast?.current.weather.first?.weatherDescription
                    
                    Text(" \(currentWeatherDescription!.rawValue.capitalized)")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }

                HStack {
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
                    Image("pressure")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Pressure: \((Int)(modelData.forecast!.current.pressure))hPa")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                }
                
                HStack {
                    Image("windSpeed")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("WindSpeed: \((Int)(modelData.forecast!.current.windSpeed))mph")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(ModelData())
    }
}
