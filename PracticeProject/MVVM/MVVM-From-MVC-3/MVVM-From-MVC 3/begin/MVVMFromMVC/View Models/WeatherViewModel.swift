/// Copyright (c) 2021 Razeware LLC
// Jina made

import UIKit.UIImage

public class WeatherViewModel {
  private let defaultAddress = "McGaheysville, VA" // 디폴트 주소
  // 문자열 입력을 받아 기상 서비스에 보내는 위도와 경도로 변환
  private let geocoder = LocationGeocoder()
  let locationName = Box("Loading...")
  let date = Box(" ")
  
  private let dateFormatter: DateFormatter = { // 날짜 포맷
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMM d"
    return dateFormatter
  }()
  
  init() {
    self.changeLocation(to: self.defaultAddress)
  }
  
  func changeLocation(to newLocation: String) {
    locationName.value = "Loading..."
    geocoder.geocode(addressString: newLocation) { [weak self] locations in
      guard let self = self else { return }
      if let location = locations.first {
        self.locationName.value = location.name
        self.fetchWeatherForLocation(location)
        return
      }
    }
  }
  
  private func fetchWeatherForLocation(_ location: Location) {
    WeatherbitService.weatherDataForLocation(
      latitude: location.latitude, longitude: location.longitude) {
      [weak self] (weatherData, error) in
        guard let self = self, let weatherData = weatherData else { return }
      self.date.value = self.dateFormatter.string(from: weatherData.date)
    }
  }

}

