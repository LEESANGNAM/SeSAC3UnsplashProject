//
//  NumberViewMode;.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/18.
//

import Foundation

class NumberViewModel {
    var number = Observable("")
    var result = Observable("")
    
    
    func convertNumber(){
        
        // 빈 값, 문자열,100만원 내
        guard  !(number.value.isEmpty) else {
            result.value = "값을 입력해주세요."
            return
        }
        guard let textTonumber = Int(number.value) else {
            result.value = "숫자를 입력 해 주세요"
            return
        }
        guard textTonumber > 0, textTonumber <= 1000000 else {
            result.value = " 100만원 이하로 환전 가능합니다."
            return
        }
        let money = textTonumber * 1327
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let decimalnumber = numberFormatter.string(for: money)
        if let decimalnumber {
            result.value = "환전 금액은 \(decimalnumber) 입니다."
        }
    }
    
}
