
import Foundation
import SwiftUI

class WeatherModel: ObservableObject {
    @Published var city: String = ""
    @Published var text: String = ""
    @Published var date: String = ""
    @Published var publishingOffice : String = ""
    @Published var date1: String = ""
    @Published var date2: String = ""
    @Published var date3: String = ""
    @Published var date4: String = ""
    
    init() {
        updateWeather(item: "")
    }
    
    func updateWeather(item: String) {
        let url = URL(string: "https://www.jma.go.jp/bosai/forecast/data/overview_forecast/\(item).json")!
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("??")
                return
            }
            
            do {
                let model = try JSONDecoder().decode(Forecast.self, from: data)
                DispatchQueue.main.async {
                    self.city = model.targetArea
                    self.text = model.text
                    self.date = model.reportDatetime
                    self.publishingOffice = model.publishingOffice
                    self.date1 = String(self.date.split(separator: "T")[0])
                    self.date2 = String(self.date.split(separator: "T")[1].split(separator: "+")[0])
                    self.date3 = String(self.date2.split(separator: ":")[0])
                    self.date4 = String(self.date2.split(separator: ":")[1])
                }
            } catch {
                print("Failed")
            }
        }
        task.resume()
    }
}
