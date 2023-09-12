//
//  LoginViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import Foundation

class LoginViewModel {
    var id = Observable("a@a.com")
    var pw = Observable("1234")
    var isValid = Observable(false)
    
    func checkValidation() {
        if id.value.count >= 6 && pw.value.count >= 4 {
            isValid.value = true
        }else{
            isValid.value = false
        }
    }
    
    func signIng(completion: @escaping () -> Void){
        //서버, 닉네임, id, pw 정도
        UserDefaults.standard.set(id.value, forKey: "id")
        completion()
    }
    
}
