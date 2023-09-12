//
//  PhotoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    var dataCount: Int {
        return list.value.results?.count ?? 0
    }
    func cellforRowAtdata(indexPath: IndexPath) -> PhotoResult{
        return list.value.results![indexPath.row]
    }
    func fetchPhoto() {
        APIService.shared.searchPhoto(query: "sky") { photo in
            guard let data = photo else {
                print("왜안나와")
                return }
            print(data)
            self.list.value = data
        }
    }
}
