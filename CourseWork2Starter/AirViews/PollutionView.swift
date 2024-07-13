//
//  PollutionView.swift
//  Coursework2
//
//  Created by GirishALukka on 30/12/2022.
//

import SwiftUI

struct PollutionView: View {
    
    // @EnvironmentObject and @State varaibles here

    var body: some View {
        
        ZStack {

            // Use ZStack for background images
            
            VStack {
                Text("Air Quality Data: ")
                
                
                HStack {
                    
                    VStack {
                        Image("so2")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("95")
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
                

                
            }.ignoresSafeArea(edges: [.top, .trailing, .leading])
        }
    }

struct PollutionView_Previews: PreviewProvider {
    static var previews: some View {
        PollutionView()
    }
}
    

