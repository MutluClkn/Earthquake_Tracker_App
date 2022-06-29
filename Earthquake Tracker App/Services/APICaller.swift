//
//  APICaller.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 26.06.2022.
//

import Foundation
import UIKit

protocol EarthquakeTrackerDelegate {
    func didUpdateView(_ apiCaller : APICaller, tracker : EarthquakeTrackerModel)
    func didFailWithError(error: Error)
}

struct APICaller {
    
    let earthquakeURL = "https://www.mertkose.net/api/son-depremler/"
    
    var delegate : EarthquakeTrackerDelegate?
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let earthquakeTracker = self.parseJSON(earthquakeData: safeData){
                        self.delegate?.didUpdateView(self, tracker: earthquakeTracker)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(earthquakeData : Data) -> EarthquakeTrackerModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(EarthquakeTracker.self, from: earthquakeData)
            let location = decodedData.data[0].other
            let magnitude = decodedData.data[0].m
            let longtitude = decodedData.data[0].lon
            let latitude = decodedData.data[0].lat
            let depth = decodedData.data[0].depth
            let date = decodedData.data[0].time
            
            let earthquakeTracker = EarthquakeTrackerModel(magnitude: magnitude, longitude: longtitude, latitude: latitude, location: location, depth: depth, date: date)
            
//            let magnitudeColor = earthquakeTracker.colorOfMagnitude
            return earthquakeTracker
            
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
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
