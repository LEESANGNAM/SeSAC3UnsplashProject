//
//  RandomPhotoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/18.
//

import Foundation

class RandomPhotoViewModel {
    var list = Observable<[RandomPhoto]>([])
//    createdAt url.thumb
    
    
    func getData() -> [RandomPhoto]{
        return list.value
    }
    
    func fetchRandomPhto(){
        APIService.shared.randomPhoto { data in
            DispatchQueue.main.async {
                print(data)
                self.list.value += data
            }
        }
    }
    
    
}
