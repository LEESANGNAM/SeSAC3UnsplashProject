//
//  CalculateViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import Foundation


class CalculateViewModel {
    
    var firstNumber = Observable("3")
    var secondNumber = Observable("7")
    
    var resultText = Observable("결과는 30입니다.")
    
    var tempText = Observable("테스트를 위한 텍스트임!")
    
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
    
    func presentNumberFormat() {
        guard let fistnum = Int(firstNumber.value) else {
            tempText.value = "숫자변환불가 문자~~~"
            return
        }
        tempText.value = format(for: fistnum)
    }
    
    func sumResult(){
        guard let fistnum = Int(firstNumber.value) else {
            print("첫번째에서 숫자입력해주세요")
            return
        }
        guard let secondnum = Int(secondNumber.value) else {
            print("두번째에서 숫자입력해주세요")
            return
        }
        resultText.value = "결과는 \(fistnum + secondnum) 입니다."
    }
}
