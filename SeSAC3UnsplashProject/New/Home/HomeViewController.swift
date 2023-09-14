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
    var cellRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell,PhotoResult>!
    var viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
        viewModel.list.bind { data in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        viewModel.fetchPhoto(text: "happy")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.viewModel.fetchPhoto(text: "blue")
        }
        cellRegisteration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.textToSecondaryTextVerticalPadding = 50
            content.imageToTextPadding = 20
            content.imageProperties.cornerRadius = 20
            content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
            content.textProperties.font = .boldSystemFont(ofSize: 30)
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
    }
    func setUI(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func setDelegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    static func layout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.list.value.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let datalist = viewModel.list.value.results else { return UICollectionViewCell() }
        let item = datalist[indexPath.row]
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: item)
        //        cell.prepareForReuse()
        return cell
    }
    
    
}

