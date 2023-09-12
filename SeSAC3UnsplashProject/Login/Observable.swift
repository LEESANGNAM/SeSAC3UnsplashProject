//
//  Observable.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import Foundation

class Observable<T> {
    
    private var listener: ((T) -> Void)?
//    = { nickname in
//        print(nickname) // 얼럿 or 변경된 닉네임 레이블, 화면전환, 네트워크통신,등등등
//    }
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value)
        listener = closure
    }
    
}
