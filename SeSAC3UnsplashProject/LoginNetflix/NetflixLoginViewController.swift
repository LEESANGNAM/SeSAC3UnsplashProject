//
//  NetflixLoginViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import UIKit
import SnapKit

class NetflixLoginViewController: UIViewController {
    
    var viewModel = NetflixLoginViewModel()
    
    let mainView = NetflixLoginView()
    override func loadView() {
        view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.user.bind { user in
//            print(user)
//        }
        viewModel.isValid.bind { bool in
            self.mainView.signButton.setTitle( bool ? "회원가입" : "아직 회원가입 못함" , for: .normal)
            self.mainView.signButton.backgroundColor = bool ? .systemBlue : .systemYellow
        }
        addTarget()
    }
    
    func addTarget(){
        mainView.stackViewElementsList.enumerated().forEach { (index,element) in
            if let element = element as? UITextField{
                element.tag = index
                element.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
            } else if let element = element as? UIButton{
                element.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
            }
        }
    }
    @objc func textFieldChange(_ sender: UITextField){
        guard let type = TextFieldType(rawValue: sender.tag) else { return }
        switch type {
        case .email:
            viewModel.user.value.email = mainView.emailTextField.text!
        case .pw:
            viewModel.user.value.pw = mainView.passwordTextField.text!
        case .nickname:
            viewModel.user.value.nickname = mainView.nicknameTextField.text!
        case .location:
            viewModel.user.value.location = mainView.locationTextField.text!
        case .code:
            viewModel.user.value.code = Int(mainView.codeTextField.text!) ?? 0
        }
        viewModel.checkUser()
    }
    @objc func signUpButtonTapped(){
        if viewModel.getisValid() {
            print("환영합니다~~ ")
            print("db에다가 정보 저장하고")
            print("다음화면으로 넘어감")
        }else{
            print("안돼 돌아가 회원가입x")
        }
    }
    
}
