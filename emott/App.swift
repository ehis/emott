//
//  App.swift
//  emott
//
//  Created by Ehidiamen Ojielu on 5/14/20.
//  Copyright © 2020 Ehidiamen Ojielu. All rights reserved.
//

import SwiftUI

struct App: View {
    @ObservedObject var openWeatherViewModel = OpenWeatherViewModel()
    
    var body: some View {
        VStack {
            Group {
                if self.openWeatherViewModel.openWeatherRequestState == .loading {
                    Text("Loading...")
                        .padding()
                } else if self.openWeatherViewModel.openWeatherRequestState == .success {
                    VStack {
                        Text(openWeatherViewModel.currentTempDetails())
                        Text(openWeatherViewModel.currentWeatherDescription())
                    }.padding()
                } else if self.openWeatherViewModel.openWeatherRequestState == .failed {
                    Text("Error reaching the server")
                } else {
                    Text("Oops something went wrong!!")
                }
            }
      
            Image(systemName: "umbrella.fill")
                .font(.system(size: 100))
        }
    }
}

struct App_Previews: PreviewProvider {
    static var previews: some View {
        App(openWeatherViewModel: OpenWeatherViewModel(openWeatherService: FakeOpenWeatherService()
        ))
            .environmentObject(Store())
    }
}
