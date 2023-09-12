//
//  LoginViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var testLabel: UILabel!
    var viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldChanged), for: .editingChanged)
        
        viewModel.id.bind { text in
            self.testLabel.text = text
        }
        viewModel.pw.bind { text in
            self.pwTextField.text = text
        }
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool //유효성 검사 못통과하면 클릭못함
            self.loginButton.backgroundColor = bool ? .systemGreen : .systemRed
        }
    }
    
    @objc func idTextFieldChanged(){
        viewModel.id.value = idTextField.text!
        print("viewmodel id: ",viewModel.id.value)
        viewModel.checkValidation()
    }
    @objc func pwTextFieldChanged(){
        viewModel.pw.value = pwTextField.text!
        print("viewmodel pw: ",viewModel.pw.value)
        viewModel.checkValidation()
    }
    
    
    @objc func loginButtonTapped(){
        viewModel.signIng {
            print("얼럿임 : 로그인 성공")
        }
//        guard let id = idTextField.text else { return }
//        guard let pw = pwTextField.text else { return }
//
//        if id.count >= 6 && pw == "1234"{
//            print("로그인 성공")
//        }else{
//            print("로그인실패")
//        }
//        print("버튼눌림")
    }
    
}
