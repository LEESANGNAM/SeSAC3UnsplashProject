//
//  HomeViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/14.
//

import Foundation
 
class HomeViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    var listCount: Int{
        return list.value.results?.count ?? 0
    }
    
    func fetchPhoto(text: String) {
        APIService.shared.searchPhoto(query: text) { photo in
            guard let data = photo else {
                print("이게보이면 안나올거임")
                return }
            print(data)
            self.list.value = data
        }
    }
    
    func getItem(index: IndexPath) -> PhotoResult?{
        guard let datalist = list.value.results else { return nil}
        return datalist[index.row]
    }
    
}
