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
    @State var show = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Group {
                    if self.openWeatherViewModel.openWeatherRequestState == .loading {
                        Text("loading...").font(.largeTitle)
                            .padding()
                    } else if self.openWeatherViewModel.openWeatherRequestState == .success {
                        VStack {
                            Text(openWeatherViewModel.currentTemp())
                                .font(.largeTitle)
                            Text(openWeatherViewModel.currentMainWeather())
                                .font(.title)
                            Text(openWeatherViewModel.currentWeatherDescription())
                                .font(.body).padding(.vertical)
                        }.padding()
                    } else if self.openWeatherViewModel.openWeatherRequestState == .failed {
                        Text("Error reaching the server")
                    } else {
                        Text("Oops something went wrong!!")
                    }
                }
                
                Button(action: {
                    withAnimation {
                        self.show.toggle()
                    }
                }) {
                    Image(systemName: self.openWeatherViewModel.currentWeatherIcon())
                        .font(.system(size: 96)).scaleEffect(show ? 1.5 : 1)
                        .animation(.easeIn(duration: 1))
                }
                .padding(24)
                .accessibility(label: Text("Image zooms on tap"))
            }
            .padding()
            //        NavigationLink(destination: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) { /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Content@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
        }
    }
}

struct App_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            App(openWeatherViewModel: OpenWeatherViewModel(openWeatherService: OpenWeatherService()
            ))
            App(openWeatherViewModel: OpenWeatherViewModel(openWeatherService: FakeOpenWeatherService()
            ))
            App(openWeatherViewModel: OpenWeatherViewModel(openWeatherService: FakeOpenWeatherService()
            ))
                .environment(\.colorScheme, .dark)
        }
    }
}
