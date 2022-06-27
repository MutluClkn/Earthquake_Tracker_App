//
//  APICaller.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 26.06.2022.
//

import Foundation
import UIKit

struct APICaller {
    let earthquakeURL = "https://api.orhanaydogdu.com.tr/deprem/index.php?date=2020-01-01&limit=100"
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(earthquakeData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(earthquakeData : Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(EarthquakeTracker.self, from: earthquakeData)
            let location = decodedData.result[0].lokasyon
            let magnitude = decodedData.result[0].mag
            let longtitude = decodedData.result[0].lng
            let latitude = decodedData.result[0].lat
            let depth = decodedData.result[0].depth
            let title = decodedData.result[0].title
            let date = decodedData.result[0].date
            
            let magnitudeColor = getRelatedColorForMagnitude(magnitudeLevel: magnitude)
            
        } catch {
            print(error)
        }
    }
    
    func getRelatedColorForMagnitude(magnitudeLevel: Double) -> UIColor {
        switch magnitudeLevel {
        case 0..<3:
            return .white
        case 3..<4:
            return .orange
        case 4..<5:
            return .green
        case 5..<6:
            return .blue
        case 6..<7:
            return .purple
        case 7...:
            return .red
        default:
            return .black
        }
    }
    
}








//class APICaller{
//
//    static let shared = APICaller()
//
//    private init() {}
//
//
//    public func getData(url: URL, completion: @escaping ([Result]?) -> ()){
//
//        URLSession.shared.dataTask(with: url) { urlData, urlResponse, urlError in
//            if let urlError = urlError {
//                print(urlError.localizedDescription)
//                completion(nil)
//            }else if let urlData = urlData {
//                let result = try? JSONDecoder().decode([Result].self, from: urlData)
//
//                if let result = result{
//                    completion(result)
//                }
//            }
//        }.resume()
//    }
//}
