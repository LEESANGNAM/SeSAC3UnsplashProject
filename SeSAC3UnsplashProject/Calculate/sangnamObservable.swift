//
//  sangnamObservable.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import Foundation


class Person<T> {
    
    var listener: ((T) -> Void)?
    var value: T {
        didSet{
            listener?(value)
            print("사용자의 이름 변경",value,"-------------")
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func introduce( sample: @escaping (T) -> Void ){
        print("저는 \(value)입니다.")
        sample(value)
        listener = sample
    }
}
