//
//  SampleViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import Foundation


class SampleViewModel {
    var list = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "KoKojong", age: 20)
    ]
    
    var numberOfRaowsInSections: Int {
        return list.count
    }
    func cellForData(at indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
}
