//
//  NetflixLoginViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import Foundation

class NetflixLoginViewModel{
    var user = Observable(NetflixUser(email: "", pw: "", nickname: "", location: "", code: 0))
    var isValid = Observable(false)
    
    
    func checkUser(){
        let userInfo = user.value
        if checkUserEmail(id: userInfo.email) && checkUserPw(pw: userInfo.pw) && checkUserName(name: userInfo.nickname) && checkUserLocation(location: userInfo.location){
            isValid.value = true
        }else{
            isValid.value = false
        }
        
    }
    func getisValid() -> Bool {
        return isValid.value
    }
    func checkUserEmail(id: String) -> Bool {
        if id.isEmpty{
            print("이메일에 값넣어주세요")
            return false
        }else if id.count <= 6 {
            print("6글자 이상 입력해주세요, 테스트고 나중에 이메일형식 체크")
            return false
        }else{
            print("이메일 완성 성공")
            return true
        }
    }
    func checkUserPw(pw: String) -> Bool {
        if pw.isEmpty{
            print("패스워드에 값넣어주세요")
            return false
        }else if pw.count <= 6 {
            print("6글자 이상 입력해주세요, 테스트고 나중에 패스워드형식(특수문자같은거) 체크")
            return false
        }else{
            print("패스워드 완성 성공")
            return true
        }
    }
    func checkUserName(name: String) -> Bool {
        if name.isEmpty{
            print("닉네임 값넣어주세요")
            return false
        }else if name.count >= 6 {
            print("6글자 이하로 입력해주세요, 나중에 중복체크?")
            return false
        }else{
            print("닉네임 완성 성공")
            return true
        }
    }
    func checkUserLocation(location: String) -> Bool {
        if location.isEmpty{
            print("주소입력! 값넣어주세요")
            return false
        }else if location.count <= 6 {
            print("6글자 이상 입력해주세요, 주소 나중에체크")
            return false
        }else{
            print("주소 완성 성공")
            return true
        }
    }
    
}
