//
//  Case2Item.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/17.
//

import Foundation

enum Case2Type: Hashable, CaseIterable{
    case allSeting
    case personalSetting
    case etc
    var sectiontitle : String {
        switch self{
        case .allSeting:
            return "전체 설정"
        case .personalSetting:
            return "개인설정"
        case .etc:
            return "기타"
        }
    }
}

struct Case2Item:Hashable {
    
    let id = UUID().uuidString
    let title: String
    let type: Case2Type
}

