//
//  Case1Item.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/17.
//

import Foundation
import UIKit

enum Case1Type: Hashable, CaseIterable {
    case modeSetting
    case etc
}


struct Case1Item:Hashable {
    
    let id = UUID().uuidString
    let title: String
    let subtitle: String?
    let image:UIImage?
    let imageColor: UIColor?
    let textInSide: Bool
}
