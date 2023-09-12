//
//  PhotoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = PhotoViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        viewModel.fetchPhoto()
        viewModel.list.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    func setDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension PhotoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell")!
        let data = viewModel.cellforRowAtdata(indexPath: indexPath)
        cell.backgroundColor = .brown
        cell.textLabel?.text = data.description
        
        
        
        return cell
    }
    
    
}
