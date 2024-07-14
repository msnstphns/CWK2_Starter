//
//  TestView.swift
//  CourseWork2Starter
//
//  Created by Mason Stephens on 14/07/2024.
//

import SwiftUI


struct TestView: View {
    
    //@EnvironmentObject var modelData: ModelData
    @EnvironmentObject var pollutionModel: PollutionModel

    var body: some View {

            ZStack {
                Image("sky")
                                .resizable()
                                .scaledToFill()
                                .edgesIgnoringSafeArea(.all)

                    
                    VStack {
                        
                        Text("Air Quality Data: ")
                            .bold()
                        
 
                        
                        
                        HStack {
                            
                            VStack {
                                Image("so2")
                                    .resizable()
                                    .frame(width: 50, height: 50)

                                


                            }

                            
                            VStack {
                                Image("no")
                                        .resizable()
                                    .frame(width: 50, height: 50)
                                Text("95")
                            }
                            
                            VStack {
                                
                                Image("voc")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("95")
                            }
                            
                            VStack {
                                Image("pm")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("95")
                            }
                        }
                        
                    }
                    
                    //Spacer()
                }
            }
            

                

                
            }//.ignoresSafeArea(edges: [.top, .trailing, .leading])

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(PollutionModel())
    }
}
