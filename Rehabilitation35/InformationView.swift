
import SwiftUI

struct InformationView: View {
    
    @StateObject var weatherModel = WeatherModel()
    
    var item : String
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, Color(.systemTeal).opacity(0.3), Color(.blue).opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            ScrollViewReader {proxyReader in
                Text("\(weatherModel.city)")
                    .font(.title)
                    .padding(.bottom, 2)
                
                Text("の天気予報")
                    .font(.system(size: 20))
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    
                    Text(weatherModel.date1)
                        .font(.system(size: 15))
                    
                    Text("\(weatherModel.date3)時 \(weatherModel.date4)分更新")
                        .font(.system(size: 15))
                }
                .padding(.horizontal, 15)
                
                ScrollView {
                    VStack {
                        Spacer()
                        
                        Text("\(weatherModel.text)")
                            .font(.system(size: 17))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(style: StrokeStyle(lineWidth: 5, dash: [5]))
                                    .foregroundColor(Color.green.opacity(0.9))
                                    .frame(width: nil, height: nil, alignment: .center)
                            )
                        Spacer()
                    } //VStack
                    .padding(.horizontal, 20)
                } //ScrollView
                .padding(.top, 10)
                .onAppear {
                    weatherModel.updateWeather(item: self.item)
                }
                Text(weatherModel.publishingOffice)
                    .font(.system(size: 15))
            }
        }
        .padding(.top, -20)
    }
}
