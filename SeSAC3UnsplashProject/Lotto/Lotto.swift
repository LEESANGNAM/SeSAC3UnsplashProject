//
//  Lotto.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import Foundation


struct Lotto: Codable {
    var drwNoDate: String
    var totSellamnt: Int            // 총상금액
    var firstWinamnt: Int           // 1등 상금액
    var firstPrzwnerCo: Int                // 1등 당첨인원
    var firstAccumamnt: Int
    var drwtNo1: Int                   // 로또번호 1
    var drwtNo2: Int                  // 로또번호 2
    var drwtNo3: Int                    // 로또번호 3
    var drwtNo4: Int                    // 로또번호 4
    var drwtNo5: Int                    // 로또번호 5
    var drwtNo6: Int                    // 로또번호 6
    var bnusNo: Int                    // 로또 보너스 번호
    var drwNo: Int                    // 로또회차
    
    var drwNoDateTime: String {
        return "회차 : \(drwNo) 날짜: \(drwNoDate)"
    }
    
}
