//
//  SampleViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import UIKit

struct User {
    let name: String
    let age: Int
    var text: String {
        return  "나는 \(name), \(age)살 "
    }
}



class SampleViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
   let viewModel = SampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        
        //
        var num1 = 10
        var num2 = 3
        
        print(num1 - num2)
        
        num1 = 3
        num2 = 1
        
        var num3 = Observable(10)
        var num4 = Observable(3)
        
        num3.bind { number in
            print("observable",num3.value - num4.value)
        }
   
        num3.value = 100
        num4.value = 10 // bind 를 하지 않아. 리스너가 없기때문에 값만 변경된다.
        num3.value = 500 //여기는 bind를 해서 리스너가 계속 실행된다.
        num3.value = 50
        
        
    }
    func setDelegate(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension SampleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRaowsInSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell")!
//        let data = viewModel.cellForData(at: indexPath)
//        cell.textLabel?.text = data.text
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "테스트"
        content.secondaryText = "안녕하세요 \(indexPath.row)"
        cell.contentConfiguration = content //protocol as type
        return cell
    }
    
    
}
