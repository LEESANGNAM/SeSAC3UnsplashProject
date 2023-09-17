//
//  Case2SettingViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/17.
//

import UIKit

class Case2SettingViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    var datasource: UICollectionViewDiffableDataSource<Case2Type,Case2Item>!
    var case2typeList = Case2Type.allCases
    var list = [
        [
            Case2Item(title: "공지사항", type: .allSeting),
            Case2Item(title: "실험실", type: .allSeting),
            Case2Item(title: "버전정보", type: .allSeting)
        ],
        [
            Case2Item(title: "개인/보안", type: .personalSetting),
            Case2Item(title: "알림", type: .personalSetting),
            Case2Item(title: "채팅", type: .personalSetting),
            Case2Item(title: "멀티프로필", type: .personalSetting)
        ],
        [
            Case2Item(title: "고객센터/도움말", type: .etc)
        ]
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setRegistration()
        var snapshot = NSDiffableDataSourceSnapshot<Case2Type,Case2Item>()
        snapshot.appendSections(case2typeList)
        for (index, section) in case2typeList.enumerated(){
            snapshot.appendItems(list[index], toSection: section)
        }
        datasource.apply(snapshot)
    }
    
    private func setRegistration(){
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell,Case2Item>(handler: { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.textProperties.color = .label
            cell.contentConfiguration = content
        })
        
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
        
    }
    
    private func setUI(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    static private func layout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    
}
