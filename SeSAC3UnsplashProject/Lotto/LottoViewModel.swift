//
//  LottoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import Foundation


class LottoViewModel {
    
    var lotto = Observable(Lotto(drwNoDate: "", totSellamnt: 0, firstWinamnt: 0, firstPrzwnerCo: 0, firstAccumamnt: 0, drwtNo1: 0, drwtNo2: 0, drwtNo3: 0, drwtNo4: 0, drwtNo5: 0, drwtNo6: 0, bnusNo: 0, drwNo: 0))
    
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
    
    func fetchLottoAPI(drwNo: Int){
        LottoAPIManager.shared.searchPhoto(query: drwNo) { data in
            guard let lotto = data else {
                print("데이터 없음")
                return
            }
            self.lotto.value = lotto
        }
    }
    
}
