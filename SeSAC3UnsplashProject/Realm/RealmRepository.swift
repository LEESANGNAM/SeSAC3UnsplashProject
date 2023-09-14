//
//  RealmRepository.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/14.
//

import Foundation
import RealmSwift


protocol DiaryTableRepositoryType: AnyObject {
        func fetch() -> Results<DiaryTable>
        func fetchFilter() -> Results<DiaryTable>
    func createItem(_ item: DiaryTable)
}

class DiartyTableRepository:DiaryTableRepositoryType {
    private let realm = try! Realm()
    
    func fetch() -> Results<DiaryTable>{
        let data = realm.objects(DiaryTable.self).sorted(byKeyPath: "diaryTitle", ascending: true)
        return data
    }
    
    func fetchFilter() -> Results<DiaryTable>{
        let result = realm.objects(DiaryTable.self).where {
            $0.photoURL != nil
        }
        return result
    }
    
    func createItem(_ item: DiaryTable){
        do{
            try realm.write {
                realm.add(item)
            }
        }catch{
            print(error)
        }
    }
    
    func updateItem(id: ObjectId, title: String, contents:String ){
        do{
            try realm.write{
                realm.create(DiaryTable.self, value: ["_id": id,"diaryTitle":title,"contents":contents], update: .modified)
            }
            }catch{
                print("에러에러에러~")
            }
    }
}
