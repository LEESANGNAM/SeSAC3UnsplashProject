//
//  NumberViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/18.
//

import UIKit

class NumberViewController: UIViewController {
    
    @IBOutlet var numberTextfield: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        numberTextfield.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
        bindData()
    }
    
    func bindData(){
        viewModel.number.bind { value in
            self.numberTextfield.text = value
        }
        viewModel.result.bind { value in
            self.resultLabel.text = value
        }
        
    }
    
    @objc func numberTextFieldChanged(){
        if let text = numberTextfield.text{
            viewModel.number.value = text
        }
        viewModel.convertNumber()
    }
    
}
