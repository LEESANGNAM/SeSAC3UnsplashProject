//
//  RandomPhtotoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/18.
//

import UIKit
import SnapKit

class RandomPhotoViewController: UIViewController {
    
    let collctionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    let viewModel = RandomPhotoViewModel()
    var datasource: UICollectionViewDiffableDataSource<Int,RandomPhoto>?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpRegistration()
        bind()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.viewModel.fetchRandomPhto()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.viewModel.fetchRandomPhto()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10){
            self.viewModel.fetchRandomPhto()
        }
        
            
    }
    
    private func setUpRegistration(){
        
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell,RandomPhoto> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.createdAt
            if let url = URL(string: itemIdentifier.urls.thumb){
                DispatchQueue.global().async {
                    do{
                        let imageData = try Data(contentsOf: url)
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            content.image = image
                            cell.contentConfiguration = content
                        }
                    }catch {
                        print("이미지 데이터 요청 실패 \(error)")
                    }
                }
            }
        }
        datasource = UICollectionViewDiffableDataSource(collectionView: collctionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    
    private func bind(){
        viewModel.list.bind { _ in
            self.updateSnapshot()
        }
    }
    
    private func updateSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Int,RandomPhoto>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.getData())
        datasource?.apply(snapshot)
    }
    
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemBlue
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    private func setUpUI(){
        view.addSubview(collctionView)
        collctionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
