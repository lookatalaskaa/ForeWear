//
//  WeatherView.swift
//  ForeWear
//
//  Created by Valeria Guardascione on 09/12/24.
//


import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    @State private var moveRight = false
    @State private var navigateToDetail = false
    @State private var ismodalshown = true
    let minHeight: CGFloat = UIScreen.main.bounds.height * 0.2
    let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.8

    var body: some View {
        NavigationStack {
            VStack {
                // Header Section
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                        .accessibilityLabel("Location: \(weather.name)")

                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                        .accessibilityLabel("Date and time: Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityElement(children: .combine)

                // Weather Information Section
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: weatherSymbol(for:weather.weather.first?.main ?? ""))
                                .font(.system(size: 40))
                                .accessibilityHidden(true) // Icon is decorative, so we hide it from VoiceOver

                            Text(weather.weather.first?.main ?? "N/A")
                                .accessibilityLabel("Main weather condition: \(weather.weather.first?.main ?? "Not available")")
                        }
                        .frame(width: 150, alignment: .leading)
                        .accessibilityElement(children: .combine)

                        Spacer()

                        let temp = Int(weather.main.temp.roundDouble())! - 273
                        Text("\(temp)°")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                            .accessibilityLabel("Temperature: \(temp) degrees Celsius")
                    }

                    // Animated Image Section
                    Image("rainyy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 450)
                        .offset(x: moveRight ? 20 : -20) // Increased offset for visible animation
                        .animation(
                            Animation.easeInOut(duration: 4)
                                .repeatForever(autoreverses: true),
                            value: moveRight
                        )
                        .onAppear {
                            moveRight = true
                        }
                        .accessibilityHidden(true) // Animation is decorative, so we hide it from VoiceOver
                }
                .sheet(isPresented: .constant(true)){
                    WeatherDetailView(weather: weather)
                        .padding()
                        .presentationDetents([.height(maxHeight), .height(minHeight)])
                        .presentationContentInteraction(.scrolls)
                        .presentationBackgroundInteraction(.enabled(upThrough: .height(maxHeight)))
                        .defaultScrollAnchor(.topLeading)
                }.background(.white)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .ignoresSafeArea(edges: .bottom) // Updated modifier
            .navigationDestination(isPresented: $navigateToDetail) {
                WeatherDetailView(weather: weather)
            }
            Spacer()
        }
    }
}

func weatherSymbol(for condition: String) -> String {
    switch condition.lowercased() {
    case "clear":
        return "sun.max"
    case "clouds":
        return "cloud"
    case "rain":
        return "cloud.rain"
    case "thunderstorm":
        return "cloud.bolt.rain"
    case "snow":
        return "cloud.snow"
    case "mist", "fog", "haze":
        return "cloud.fog"
    default:
        return "cloud"
    }
}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
