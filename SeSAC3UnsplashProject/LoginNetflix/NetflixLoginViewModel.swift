//
//  NetflixLoginViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import Foundation

class NetflixLoginViewModel{
    var user = Observable(NetflixUser(email: "", pw: "", nickname: "", location: "", code: ""))
    var isValid = Observable(false)
    var validMessages: [String] = []
    
    func checkUser(){
        let userInfo = user.value
        validMessages = []
        let isEmailValid = checkUserEmail(id: userInfo.email)
        let isPwValid = checkUserPw(pw: userInfo.pw)
        let isNameValid = checkUserName(name: userInfo.nickname)
        let isLocationValid = checkUserLocation(location: userInfo.location)
        let isCodeValid = checkUserCode(code: userInfo.code)
        
        if  isEmailValid &&  isPwValid && isNameValid && isLocationValid && isCodeValid{
            validMessages.append("회원가입 가능~")
            isValid.value = true
        }else{
            isValid.value = false
        }
        
    }
    func getValidMessage() -> String {
        var resultText = ""
        for text in validMessages{
            resultText += (text + "\n")
        }
        return resultText
    }
    func getisValid() -> Bool {
        return isValid.value
    }
    func checkUserEmail(id: String) -> Bool {
        if id.isEmpty{
            print("이메일에 값넣어주세요")
            validMessages.append("이메일에 값넣어주세요")
            return false
        }else if id.count < 6 {
            print("이메일을 6글자 이상 입력해주세요")
            validMessages.append("이메일을 6글자 이상 입력해주세요")
            return false
        }else if id.contains("@"){
            print("이메일 완성 성공")
            return true
        }else {
            print("이메일 형식을 지켜주세요 @입력")
            validMessages.append("이메일 형식을 지켜주세요 @입력")
            return false
        }
    }
    func checkUserPw(pw: String) -> Bool {
        if pw.isEmpty{
            print("패스워드에 값넣어주세요")
            validMessages.append("패스워드에 값넣어주세요")
            return false
        }else if pw.count < 6 {
            print("패스워드를 6글자 이상 입력해주세요")
            validMessages.append("패스워드를 6글자 이상 입력해주세요")
            return false
        }else if pw.count >= 10{
            print("패스워드 는 6 ~ 10 이하로 설정해주세요")
            validMessages.append("패스워드 는 6 ~ 10 이하로 설정해주세요")
            return false
        }else {
            print("패스워드 완성")
            return true
        }
    }
    func checkUserName(name: String) -> Bool {
        if name.isEmpty{
            print("닉네임 값넣어주세요")
            validMessages.append("닉네임 값넣어주세요")
            return false
        }else if name.count > 6 {
            print("닉네임은 6글자 이하로 입력해주세요")
            validMessages.append("닉네임은 6글자 이하로 입력해주세요")
            return false
        }else{
            print("닉네임 완성 성공")
            return true
        }
    }
    func checkUserCode(code: String) -> Bool {
        if Int(code) == nil{
            print("코드는 숫자만 입력해주세요")
            validMessages.append("코드는 숫자만 입력해주세요")
            return false
        }else if code.isEmpty{
            print("추천코드 값넣어주세요")
            validMessages.append("추천코드 값넣어주세요")
            return false
        }else if code.count == 6 {
            print("6글자 확인 코드 성공")
            return true
        }else{
            print("6글자 추천코드를 넣어주세요")
            validMessages.append("6글자 추천코드를 넣어주세요")
            return false
        }
    }
    func checkUserLocation(location: String) -> Bool {
        if location.isEmpty{
            print("주소입력! 값넣어주세요")
            validMessages.append("주소입력! 값넣어주세요")
            return false
        }else if location.count < 6 {
            print("주소는 6글자 이상 입력해주세요")
            validMessages.append("주소는 6글자 이상 입력해주세요")
            return false
        }else{
            print("주소 완성 성공")
            return true
        }
    }
    
}
