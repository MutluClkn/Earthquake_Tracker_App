//
//  AnnotationViewModel.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 26.06.2022.
//

import Foundation

struct AnnotationViewModel{
    let result : Result
    
    var longitude : Double{
        return self.result.lng
    }
    var latitude : Double{
        return self.result.lat
    }
    var magnitude : Double{
        return self.result.mag
    }
    var location : String {
        return self.result.lokasyon
    }
    var depth : Double{
        return self.result.depth
    }
    var coordinates : [Double] {
        return self.result.coordinates
    }
    var title : String {
        return self.result.title
    }
    var date : String {
        return self.result.date
    }
}
