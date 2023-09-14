//
//  RealmModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/14.
//

import Foundation
import RealmSwift

class DiaryTable: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var diaryTitle: String // 일기 제목 (필수)
    @Persisted var diaryDate: Date // 일기 등록 날짜 (필수)
    @Persisted var contents: String? // 일기 내용 (옵션)
    @Persisted var photoURL: String? // 사진 (옵션)
    @Persisted var diaryLike: Bool //즐겨찾기 기능 (필수)
//    @Persisted var diaryPin: Bool
    @Persisted var diarySummary: String
    
    convenience init(diaryTitle: String, diaryDate: Date, diaryContents: String? = nil, diaryPhotoURL: String? = nil) {
        self.init()
        self.diaryTitle = diaryTitle
        self.diaryDate = diaryDate
        self.contents = diaryContents
        self.photoURL = diaryPhotoURL
        self.diaryLike = true
        self.diarySummary = "제목은 '\(diaryTitle )'이고, 내용은 '\(diaryContents)'입니다."
    }
}

