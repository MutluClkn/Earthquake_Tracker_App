//
//  EarthquakeViewModel.swift
//  Earthquake Tracker App
//
//  Created by Mutlu Çalkan on 26.06.2022.
//

import Foundation

struct EarthquakeViewModel{
    let list : [Result]
}

extension EarthquakeViewModel{
    
    func resultsAtIndexPath(_ index: Int) -> AnnotationViewModel{
        let results = self.list[index]
        return AnnotationViewModel(result: results)
    }
    
}
