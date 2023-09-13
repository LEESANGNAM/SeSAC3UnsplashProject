//
//  LottoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import UIKit

class LottoViewController: UIViewController {
    
    let mainView = LottoView()
    let viewModel = LottoViewModel()
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        mainView.textfield.addTarget(self, action: #selector(textFieldEnterTapped), for: .editingDidEndOnExit)
    }
    
    @objc func textFieldEnterTapped(_ sender: UITextField){
        guard let text = sender.text, !text.isEmpty else {
            print("글자입력 해주세요")
            return
        }
        guard let textNum = Int(text) else {
            print("숫자 변환 불가능")
            return
        }
        viewModel.fetchLottoAPI(drwNo: textNum)
    }
    
    func bindData(){
        viewModel.lotto.bind { lotto in
            DispatchQueue.main.async {
                self.mainView.DateNoLabel.text = lotto.drwNoDateTime
                self.mainView.firstLabel.text = "1등 당첨금 : \(self.viewModel.format(for: lotto.firstWinamnt))"
                self.mainView.number1label.text = "첫번째 당첨 숫자 : \(lotto.drwtNo1)"
                self.mainView.number2label.text = "두번째 당첨 숫자 : \(lotto.drwtNo2)"
                self.mainView.number3label.text = "세번째 당첨 숫자 : \(lotto.drwtNo3)"
                self.mainView.number4label.text = "네번째 당첨 숫자 : \(lotto.drwtNo4)"
                self.mainView.number5label.text = "다섯번째 당첨 숫자 : \(lotto.drwtNo5)"
                self.mainView.number6label.text = "여섯번째 당첨 숫자 : \(lotto.drwtNo6)"
                self.mainView.bonusNumlabel.text = "보너스 당첨 숫자 : \(lotto.bnusNo)"
            }
            
        }
    }
    
}
