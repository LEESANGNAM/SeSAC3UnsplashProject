//
//  NetflixLoginView.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import UIKit

class NetflixLoginView: BaseView{
    let titleLabel = {
        let label = UILabel()
        label.text = "SANGNAMFLIX"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .blue
        return label
    }()
    
    
    let emailTextField = {
        let textField = GrayBackgroundTextField()
        textField.setUpPlaceHolder(placeholder: "이메일 주소 또는 전화번호")
        return textField
    }()
    let passwordTextField = {
        let textField = GrayBackgroundTextField()
        textField.setUpPlaceHolder(placeholder: "비밀번호")
        return textField
    }()
    let nicknameTextField = {
        let textField = GrayBackgroundTextField()
        textField.setUpPlaceHolder(placeholder: "닉네임")
        return textField
    }()
    let locationTextField = {
        let textField = GrayBackgroundTextField()
        textField.setUpPlaceHolder(placeholder: "위치")
        return textField
    }()
    let codeTextField = {
        let textField = GrayBackgroundTextField()
        textField.setUpPlaceHolder(placeholder: "추천 코드 입력")
        return textField
    }()
    let signButton = {
        let button = WhiteBackgroundButton()
        button.setImageAndTitle(title: "회원가입")
        return button
    }()
    let signStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fill
        return stack
    }()
    
    
    let infoView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    let addInfoLabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray5
        return label
    }()
    let switchButton = {
        let button = UISwitch()
        button.onTintColor = .blue
        return button
    }()
    
    
    lazy var stackViewElementsList: [UIView] = [emailTextField,passwordTextField,nicknameTextField,locationTextField,codeTextField,signButton,infoView]
    
    
    override func setUpView(){
        backgroundColor = .black
       
        setUpSignStackViewElementConstraint()
        addInfoViewElement()
        setUpInfoViewConstraint()
        addStackViewElement()
        setUpSignStackViewConstraint()
        setUpSignStackViewElementConstraint()
        addTitleLabel()
        
    }
    
    
    func addTitleLabel(){
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.bottom.greaterThanOrEqualTo(signStackView.snp.top).offset(-20)
        }
    }
    
    
    func addStackViewElement(){
        addSubview(signStackView)
        stackViewElementsList.forEach {
            signStackView.addArrangedSubview($0)
        }
    }
    
    func setUpSignStackViewConstraint(){
        signStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.centerY.equalToSuperview()
        }
    }
    func setUpSignStackViewElementConstraint(){
        stackViewElementsList.forEach {
            if let element = $0 as? UITextField{
                element.snp.makeConstraints { make in
                    make.height.equalTo(40)
                }
            } else if let element = $0 as? UIButton{
                element.snp.makeConstraints { make in
                    make.height.equalTo(50)
                }
            } else{
                // UIview 높이는 설정 x
            }
        }
        
    }
    
    func addInfoViewElement(){
        infoView.addSubview(addInfoLabel)
        infoView.addSubview(switchButton)
    }
    
    func setUpInfoViewConstraint(){
        addInfoLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalTo(switchButton.snp.leading).offset(20)
        }
        
        switchButton.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
