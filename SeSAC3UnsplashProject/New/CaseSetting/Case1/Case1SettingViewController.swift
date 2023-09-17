//
//  SettingViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/16.
//

import UIKit


class Case1SettingViewController: UIViewController {
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    var datasouce: UICollectionViewDiffableDataSource<Case1Type,Case1Item>!
    var settingList = [
        [
            Case1Item(title: "방해 금지 모드", subtitle: "켬", image: UIImage(systemName: "moon.fill"), imageColor: .systemPurple, textInSide: true),
            Case1Item(title: "수면", subtitle: nil, image: UIImage(systemName: "bed.double.fill"), imageColor: .systemOrange, textInSide: false),
            Case1Item(title: "업무", subtitle: "09:00 ~ 18:00", image: UIImage(systemName: "lanyardcard.fill"), imageColor: .systemGreen, textInSide: false),
            Case1Item(title: "개인시간", subtitle: "설정", image: UIImage(systemName: "person.fill"), imageColor: .systemBlue, textInSide: true)
        ],
        [
            Case1Item(title: "모든 기기에서 공유", subtitle: "스위치", image: nil, imageColor: nil, textInSide: true)
        ]
    ]
    var case1typeList = Case1Type.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setRegisteration()
        
        var snapshot = NSDiffableDataSourceSnapshot<Case1Type,Case1Item>()
        snapshot.appendSections(case1typeList)
        for (index, section) in case1typeList.enumerated(){
            snapshot.appendItems(settingList[index], toSection: section)
        }
        
        datasouce.apply(snapshot)
    }
    
    private func setRegisteration(){
        let cellRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell,Case1Item> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.secondaryText = itemIdentifier.subtitle
            content.text = itemIdentifier.title
            content.prefersSideBySideTextAndSecondaryText = itemIdentifier.textInSide
            content.image = itemIdentifier.image
            content.imageProperties.tintColor = itemIdentifier.imageColor
            cell.contentConfiguration = content
        }
        
        datasouce = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
//            let enableWifiSwitch = UISwitch()
//            enableWifiSwitch.isOn = true
//            enableWifiSwitch.addTarget(self, action: #selector(toggleSwitchTapped), for: .touchUpInside)
//            cell.accessoryView = enableWifiSwitch
            cell.accessories = [.disclosureIndicator()]
            return cell
        })
        
        
    }
    
//    @objc func toggleSwitchTapped(){
//
//    }
    
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

