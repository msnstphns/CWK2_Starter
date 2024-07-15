import SwiftUI

struct HourlyView: View {
    
   @EnvironmentObject var modelData: ModelData

    var body: some View {
        ZStack {
            /*Image("sky")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)*/
            VStack{
                
                // list of hourly forecasts
                List {
                    ForEach(modelData.forecast!.hourly) { hour in
                        HourCondition(current: hour)
                        
                    }
                }
            }
        }
    }
}

struct Hourly_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView().environmentObject(ModelData())
    }
}
