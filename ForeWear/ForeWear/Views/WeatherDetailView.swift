//
//  WeatherDetailView.swift
//  ForeWear
//
//  Created by Valeria Guardascione on 15/12/24.
//

import SwiftUI

struct WeatherDetailView: View {
    var weather: ResponseBody
    
    var body: some View {
        VStack {
            // Title at the top
            Text("Current details")
                .font(.largeTitle)
                .bold()
                .padding()
                .accessibilityLabel("Detailed Information")

            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    let tempmin = Int(weather.main.tempMin.roundDouble())! - 273
                    WeatherRow(logo: "thermometer", name: "Min temp", value: (String(tempmin) + "°"))
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Minimum temperature, \(tempmin) degrees Celsius")
                    
                    Spacer()

                    let tempmax = Int(weather.main.tempMax.roundDouble())! - 273
                    WeatherRow(logo: "thermometer", name: "Max temp", value: (String(tempmax) + "°"))
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Maximum temperature, \(tempmax) degrees Celsius")
                }
                
                HStack {
                    WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Wind speed, \(weather.wind.speed.roundDouble()) meters per second")

                    Spacer()

                    WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Humidity, \(weather.main.humidity.roundDouble()) percent")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.bottom, 20)
            .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .background(Color.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            
            Spacer() // Pushes content to the top
        }
        .padding() // Adding overall padding to the VStack
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(weather: previewWeather)
    }
}

