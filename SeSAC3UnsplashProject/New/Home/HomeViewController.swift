//
//  HomeViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/14.
//

import UIKit
import SnapKit
import RealmSwift
import Kingfisher

class HomeViewController: UIViewController {
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    private var viewModel = HomeViewModel()
    var dataSource: UICollectionViewDiffableDataSource<Int, PhotoResult>!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
//        setDelegate()
        var snapshot = NSDiffableDataSourceSnapshot<Int,PhotoResult>()
        snapshot.appendSections([0])
        setCellRegisteration()
        
        viewModel.list.bind { data in
            guard let dataResult = data.results else {
                print("이거나오면 데이터 없는거임~")
                return }
            snapshot.appendItems(dataResult)
            DispatchQueue.main.async { [weak self] in
//                self.collectionView.reloadData()
                self?.dataSource.apply(snapshot)
                
            }
        }
        viewModel.fetchPhoto(text: "happy")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.viewModel.fetchPhoto(text: "blue")
        }
        
    }
    
    func setCellRegisteration(){
        let cellRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell,PhotoResult>(handler: { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            
            content.imageToTextPadding = 20
            content.imageProperties.cornerRadius = 20
            content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
            
            content.textProperties.font = .boldSystemFont(ofSize: 30)
            content.secondaryText = content.description
            
            content.textProperties.numberOfLines = 1
            content.secondaryTextProperties.numberOfLines = 2
            
            content.textToSecondaryTextVerticalPadding = 50
            content.secondaryTextProperties.color = .blue
            
            content.text = itemIdentifier.description ?? "설명없어요?"
            content.secondaryText = itemIdentifier.urls.thumb
            
            if let url = URL(string:itemIdentifier.urls.thumb){
                DispatchQueue.global().async {
                    do{
                        let imageData = try Data(contentsOf: url)
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            content.image = image
                            cell.contentConfiguration = content
                        }
                    }catch{
                        print("데이터 변환 오류")
                    }
                }
            }
        })
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    func setUI(){
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
    
//    func setDelegate(){
//        collectionView.dataSource = self
//        collectionView.delegate = self
//    }
    
}

//extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.listCount
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//        guard let item = viewModel.getItem(index: indexPath) else { return UICollectionViewCell()}
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: item)
//        //        cell.prepareForReuse()
//        return cell
//    }
//
//
//}

