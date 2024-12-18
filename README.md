# ForeWear
ForeWear is a SwiftUI-based iOS application that delivers personalized weather information based on your current location. Leveraging the OpenWeather API, ForeWear not only provides up-to-date weather data but also enhances user experience with an animated avatar. Depending on the prevailing weather conditions, the avatar is dressed appropriately, offering a visual and engaging way to stay informed about the weather.

## Features 
- **Location-Based Weather Data**: Detects your location to provide real-time weather updates.
- **OpenWeather API Integration**: Fetches comprehensive weather information including temperature, humidity and wind speed.
- **Animated Avatar**: Displays a unique avatar drawn in ProCreate and animated with SwiftUI, dressed according to the weather conditions.
- **Intuitive SwiftUI Interface**: Modern and responsive UI built entirely with SwiftUI for a seamless user experience.
- **VoiceOver Support**: Accessible with VoiceOver, ensuring that users with visual impairments can easily navigate and use the app.

## API Reference
### OpenWeather API
ForeWear uses the OpenWeather API to fetch current weather data based on the user's location.

- **Base URL**: `https://api.openweathermap.org/data/2.5/weather`
- **Parameters**:
  - `lat` – Latitude
  - `lon` – Longitude
  - `appid` – Your unique API key
  - `units` – Units of measurement (e.g., `metric`)

**Example Request**

```swift
let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(YOUR_API_KEY)&units=metric")!
