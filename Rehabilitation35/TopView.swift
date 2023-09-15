
import SwiftUI

struct TopView: View {
    @StateObject var weatherModel = WeatherModel()
    @StateObject var cityModel = CityModel()
    
    init() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        UITableView.appearance().backgroundView = UIView()
        UITableView.appearance().backgroundView?.layer.insertSublayer(gradientLayer, at: 0)
        
        UINavigationBar.appearance().barTintColor = UIColor.systemBlue
    }
    
    var body: some View {
        NavigationView {
            ScrollViewReader {proxyReader in
                List {
                    ForEach(0..<cityModel.data.count, id: \.self) { i in
                        Section("\(cityModel.data[i])") {
                            ForEach(0..<cityModel.num[i].count, id: \.self) { item in
                                NavigationLink(destination: InformationView(item: cityModel.num[i][item])) {
                                    Text(cityModel.cityName[i][item])
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("地域別天気情報")
            }
        }
    }
}

struct ContentVIew_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
