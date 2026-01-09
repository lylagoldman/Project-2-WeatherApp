//
//  ContentView.swift
//  Project 2 - Weather App
//
//  Created by Lyla Goldman on 10/20/25.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Text("MY LOCATION")
                .fontWeight(.regular)
            Text("Chapel Hill")
                .font(.system(size: 35, weight: .regular))
            Text("67°")
                .font(.system(size: 100, weight: .thin))
                .foregroundColor(.white)
                .padding(.leading)

            Text("Sunny")
                .font(.system(size: 20, weight: .semibold))
            Text("H:75°   L:41°")
                .fontWeight(.semibold)
        }
        .foregroundColor(.white)
    }
}
struct HourlyRowView: View {
    
    let times = ["Now", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM","6:32PM", "7PM", "8PM", "9PM"]
    let weatherSymbols = ["sun.max.fill", "sun.max.fill", "sun.max.fill", "cloud.sun.fill", "sun.max.fill", "cloud.sun.fill", "cloud.fill", "sunset.fill", "cloud.moon.fill", "moon.stars.fill", "cloud.fill"]
    let todayTemperatures = ["67°", "70°","73°", "74°", "74°", "73°", "70°", "Sunset", "67°", "65°", "64°"]
    
    func createSymbol(symbol: String) -> some View {
        Image(systemName: symbol)
            .symbolRenderingMode(.multicolor)
            .imageScale(.medium)
            .font(.largeTitle)
            .frame(height: 60, alignment: .center)
            .frame(width: 50, alignment: .center)

    }
    
    func createHourlyTempView(hourIndex: Int, symbolIndex: Int) -> some View {
        VStack {
                Text(times[hourIndex])
                    .fontWeight(.bold)
                    .padding(.bottom, 3)
                    .frame(height: 20, alignment: .center)
            
                createSymbol(symbol: weatherSymbols[symbolIndex])
                .padding(.bottom, 3)
            
                Text(todayTemperatures[hourIndex])
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(width: 80, alignment: .center)

            }
        }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top) {
                ForEach (0...9, id: \.self) { index in
                    createHourlyTempView(hourIndex: index, symbolIndex: index)
                        .frame(width: 70, alignment: .center)
                }
            }
        }
    }
}

struct HourlyForecastView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "clock")
                    .fontWeight(.bold)
                Text("HOURLY FORECAST")
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 5)
            .padding(.bottom, 5)
            
            HourlyRowView()
        }
    }
}


struct WeeklyRowView: View {
    let dayNames = ["Today", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu"]
    let lowTemperatures = ["41°", "50°", "43°", "42°", "40°","42°", "49°", "49°", "48°", "47°"]
    let highTemperatures = ["75°", "67°", "67°", "63°", "63°","63°", "59°", "61°", "62°", "61"]
    let weeklySymbols = ["cloud.sun.fill", "sun.max.fill", "sun.max.fill", "sun.max.fill", "cloud.sun.fill", "cloud.fill", "cloud.rain.fill", "cloud.rain.fill", "cloud.rain.fill", "cloud.rain.fill"]
    
    func createSymbol(symbol: String) -> some View {
        Image(systemName: symbol)
            .symbolRenderingMode(.multicolor)
            .imageScale(.medium)
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func createWeeklyNamesView(myIndex: Int) -> some View {
        HStack {
                Text(dayNames[myIndex])
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(width: 80, alignment: .leading)
                    .frame(height: 40, alignment: .center)
                    .padding(.leading, 10)
            
        }
    }
    func createWeeklySymbolsView(myIndex: Int) -> some View {
        HStack {
                createSymbol(symbol: weeklySymbols[myIndex])
                    .frame(width: 50, alignment: .center)
                    .frame(height: 40, alignment: .center)

        }
            }
    func createWeeklyLowsView(myIndex: Int) -> some View {
        HStack {
                Text(lowTemperatures[myIndex])
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(width: 45, alignment: .leading)
                    .frame(height: 40, alignment: .center)
        }
    }
    
    func createWeeklyHighsView(myIndex: Int) -> some View {
        HStack {
                Text(highTemperatures[myIndex])
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(width: 45, alignment: .trailing)
                    .frame(height: 40, alignment: .center)
        }
    }
    func createBars(myIndex: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(red: 0/255.0, green: 100/255.0, blue: 220/255.0))
                    .frame(width: 100, height: 6)

            HStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(red: 98/255.0, green: 178/255.0, blue: 240/255.0))
                        .frame(width: CGFloat.random(in: 20...60))
                        .frame(height: 6)
                        .padding(.trailing, CGFloat.random(in: 0...50))
                        .frame(maxWidth: 100)
            }
            
        }
        .frame(maxHeight: 40, alignment: .center)

    }

    var body: some View {
        ScrollView(.vertical) {
            HStack {
                VStack {
                    ForEach (0...9, id: \.self) { index in
                        createWeeklyNamesView(myIndex: index)
                        Spacer()
                    }
                }
                VStack {
                    ForEach (0...9, id: \.self) { index in
                        createWeeklySymbolsView(myIndex: index)
                        Spacer()
                    }
                }
                VStack {
                    ForEach (0...9, id: \.self) { index in
                        createWeeklyLowsView(myIndex: index)
                        Spacer()
                    }
                }
                VStack {
                    ForEach (0...9, id: \.self) { index in
                        createBars(myIndex: index)
                        Spacer()
                    }
                }
                VStack {
                    ForEach (0...9, id: \.self) { index in
                        createWeeklyHighsView(myIndex: index)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }

        }
    }
}
    
struct WeeklyForecastView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "calendar")
                    .fontWeight(.bold)
                Text("10-DAY FORECAST")
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading, 5)
        
            WeeklyRowView()
            
        }
    }
}

struct ContentView: View {
    let blockColor: Color = Color(red: 22/255.0, green: 146/255.0, blue: 243/255.0)
    let backgroundGradient = LinearGradient(
        colors: [Color(red: 26/255.0, green: 152/255.0, blue: 242/255.0), Color(red: 98/255.0, green: 178/255.0, blue: 240/255.0)],
            startPoint: .top,
            endPoint: .bottom
        )

    var body: some View {
        ZStack {
            VStack {
                TitleView()
                    .padding(.bottom, 60)
                HourlyForecastView()
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(blockColor)
                        .cornerRadius(15)
                        .frame(width: 380)
                        .padding(.bottom)
        
                WeeklyForecastView()
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(blockColor)
                        .cornerRadius(15)
                        .frame(width: 380)
                    

            }
            
        }
        .padding(.top, 70)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(backgroundGradient)
                    .edgesIgnoringSafeArea(.all)

    }
}

#Preview {
    ContentView()
}
