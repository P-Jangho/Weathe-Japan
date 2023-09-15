
import Foundation

struct Forecast: Decodable {
    let publishingOffice: String
    let reportDatetime: String
    let targetArea: String
    let headlineText: String
    let text: String
}
