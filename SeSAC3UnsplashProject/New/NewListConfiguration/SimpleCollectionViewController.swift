//
//  SimpleCollectionViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/14.
//

import UIKit
import SnapKit
class SimpleCollectionViewController: UIViewController {
    var list = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "KoKojong", age: 20)
    ]
    var cellRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell,User>!
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        // UICollectionView.CellRegistration : ios14, 제네릭 사용, 셀이 생성 될 때마다 클로저가 호출
        cellRegisteration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            
            //셀 디자인 및 데이터 처리
            var content =  UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.color = .systemPurple
            content.secondaryText = "\(itemIdentifier.age)"
            content.image = UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .systemPink
            content.prefersSideBySideTextAndSecondaryText = false
            content.textToSecondaryTextVerticalPadding = 20
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .systemBlue
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 10
            backgroundConfig.strokeColor = .systemYellow
            cell.backgroundConfiguration = backgroundConfig
        })
        
    }
    func setUpUI(){
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        let layout = SimpleCollectionViewController.createLayout()
        collectionView.collectionViewLayout = layout
        
    }
    static func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemGreen
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}

extension SimpleCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration , for: indexPath, item: list[indexPath.item])
        return cell
    }
    
    
}
