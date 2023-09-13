//
//  LottoView.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import UIKit
import SnapKit

class LottoView: BaseView{
    let textfield = {
        let view = UITextField()
        view.placeholder = "회차를 입력해주세요"
        return view
    }()
    let DateNoLabel = {
        let label = UILabel()
        label.text = "날짜 회차"
        return label
    }()
    let firstLabel = {
        let label = UILabel()
        label.text = "당첨금액"
        return label
    }()
    let number1label = {
        let label = UILabel()
        label.text = "첫번째 당첨 숫자"
        return label
    }()
    let number2label = {
        let label = UILabel()
        label.text = "두번째 당첨 숫자"
        return label
    }()
    let number3label = {
        let label = UILabel()
        label.text = "세번째 당첨 숫자"
        return label
    }()
    let number4label = {
        let label = UILabel()
        label.text = "네번째 당첨 숫자"
        return label
    }()
    let number5label = {
        let label = UILabel()
        label.text = "다섯번째 당첨 숫자"
        return label
    }()
    let number6label = {
        let label = UILabel()
        label.text = "여섯번째 당첨 숫자"
        return label
    }()
    let bonusNumlabel = {
        let label = UILabel()
        label.text = "보너스번째 당첨 숫자"
        return label
    }()
    
    
    override func setUpView() {
        backgroundColor = .white
        addSubview(textfield)
        addSubview(DateNoLabel)
        addSubview(firstLabel)
        addSubview(number1label)
        addSubview(number2label)
        addSubview(number3label)
        addSubview(number4label)
        addSubview(number5label)
        addSubview(number6label)
        addSubview(bonusNumlabel)
    }
    
    override func setConstraints() {
        textfield.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
        }
        DateNoLabel.snp.makeConstraints { make in
            make.top.equalTo(textfield.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        firstLabel.snp.makeConstraints { make in
            make.top.equalTo(DateNoLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        number1label.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        number2label.snp.makeConstraints { make in
            make.top.equalTo(number1label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        number3label.snp.makeConstraints { make in
            make.top.equalTo(number2label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        number4label.snp.makeConstraints { make in
            make.top.equalTo(number3label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        number5label.snp.makeConstraints { make in
            make.top.equalTo(number4label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        number6label.snp.makeConstraints { make in
            make.top.equalTo(number5label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        bonusNumlabel.snp.makeConstraints { make in
            make.top.equalTo(number6label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    
    
}
