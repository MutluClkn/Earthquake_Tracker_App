//
//  APICaller.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 26.06.2022.
//

import Foundation

class APICaller{
    
    static let shared = APICaller()
    
    private init() {}
    
    
    public func getData(url: URL, completion: @escaping ([Result]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { urlData, urlResponse, urlError in
            if let urlError = urlError {
                print(urlError.localizedDescription)
                completion(nil)
            }else if let urlData = urlData {
                let result = try? JSONDecoder().decode([Result].self, from: urlData)
                
                if let result = result{
                    completion(result)
                }
            }
        }.resume()
    }
}
