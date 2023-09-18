//
//  SimpleCollectionViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/14.
//

import UIKit
import SnapKit
class SimpleCollectionViewController: UIViewController {
    
    enum SectionType: Int,CaseIterable {
        case first = 2000
        case second = 2
        case test = 3
    }

    var viewModel = SimpleViewModel()
    //(cellForItemAt)
//    var dataSource: UICollectionViewDiffableDataSource<SectionType,User>! // hashable 채택해라~
    var dataSource: UICollectionViewDiffableDataSource<String,User>! // hashable 채택해라~
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setCellRegisteration()
        updateSnapShot()
        collectionView.delegate = self
        viewModel.list.bind { _ in
            self.updateSnapShot()
        }
        
        
        
//        var snapshot = NSDiffableDataSourceSnapshot<SectionType,User>()
//        snapshot.appendSections(SectionType.allCases)
//        snapshot.appendItems(list2, toSection: .first)
//        snapshot.appendItems(list, toSection: .second)
        
        
//        snapshot.appendSections([0,1,2,3])
//        snapshot.appendItems(list, toSection: 0)
//        snapshot.appendItems(list2, toSection: 1)
        
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.viewModel.append()
            self.updateSnapShot()
        }
//
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
//            let user = User(name: "sangnam", age: 24)
////            self.list.append(user)
//            print("실행완료")
//            snapshot.appendItems([user], toSection: "고래밥")
//            self.dataSource.apply(snapshot)
//        }
    }
    
    func updateSnapShot(){
        var snapshot = NSDiffableDataSourceSnapshot<String,User>()
        snapshot.appendSections(["고래밥","칙촉"])
        snapshot.appendItems(viewModel.list2, toSection: "고래밥")
        snapshot.appendItems(viewModel.list.value, toSection: "칙촉")
        dataSource.apply(snapshot)
        
    }
    
    
    private func setCellRegisteration(){
//        var cellRegisteration: UICollectionView.CellRegistration! // collectionView.register
        // UICollectionView.CellRegistration : ios14, 제네릭 사용, 셀이 생성 될 때마다 클로저가 호출
       let cellRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell,User>(handler: { cell, indexPath, itemIdentifier in
            
            //셀 디자인 및 데이터 처리
            var content =  UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.color = .darkGray
            content.textProperties.font = .boldSystemFont(ofSize: 20)
            content.secondaryText = "\(itemIdentifier.age)살"
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
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration , for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    
    func setUpUI(){
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        let layout = SimpleCollectionViewController.createLayout()
        collectionView.collectionViewLayout = layout
        
    }
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemGreen
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}

extension SimpleCollectionViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.insertUser(name: searchBar.text)
    }
}

extension SimpleCollectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let user = viewModel.list.value[indexPath.item]
        
        guard let item = dataSource.itemIdentifier(for: indexPath) else {
            return
        }// 아이템 가져오기
        
        dump(item)
        
//        viewModel.removeUser(idx: indexPath.item)
    }
}


//extension SimpleCollectionViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration , for: indexPath, item: list[indexPath.item])
//        return cell
//    }
//}
