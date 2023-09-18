//
//  PhotoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = PhotoViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Int,PhotoResult>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBar()
        collectionView.collectionViewLayout = createLayout()
        configureDataSource()
//        viewModel.fetchPhoto()
        viewModel.list.bind { _ in
            self.updateSnapShot()
        }
        
    }
    private func updateSnapShot(){
        var snapshot = NSDiffableDataSourceSnapshot<Int,PhotoResult>()
        snapshot.appendSections([0])
        if let data = viewModel.list.value.results{
            snapshot.appendItems(data)
            dataSource?.apply(snapshot)
        }
    }
    private func configureDataSource(){
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell,PhotoResult>{ cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            
            content.text = "\(itemIdentifier.likes)"
            
//            if let url = URL(string:itemIdentifier.urls.thumb){
//                DispatchQueue.global().async {
//                    do{
//                        let imageData = try Data(contentsOf: url)
//                        let image = UIImage(data: imageData)
//                        DispatchQueue.main.async {
//                            content.image = image
//                            cell.contentConfiguration = content
//                        }
//                    }catch{
//                        print("데이터 변환 오류")
//                    }
//                }
//            }
            
            DispatchQueue.global().async {
                let url = URL(string: itemIdentifier.urls.thumb)!
                let data = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    content.image = UIImage(data: data!)
                    cell.contentConfiguration = content
                }
            }
            
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            return cell
        })
    }
    
    private func setSearchBar(){
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemGreen
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    func setDelegate(){

    }
}

extension PhotoViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text{
            viewModel.fetchPhoto(text: text)
        }
    }
}

