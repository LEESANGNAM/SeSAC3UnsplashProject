//
//  CalculateViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/13.
//

import UIKit

class CalculateViewController: UIViewController{
    
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    
    let viewModel = CalculateViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.addTarget(self, action: #selector(firstTextFieldChanged), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondTextFieldChanged), for: .editingChanged)
        
        viewModel.firstNumber.bind { number in
            self.firstTextField.text = number
        }
        
        viewModel.secondNumber.bind { number in
            self.secondTextField.text = number
        }
        
        viewModel.resultText.bind { text in
            self.resultLabel.text = text
        }
        viewModel.tempText.bind { text in
            self.teamLabel.text = text
        }
        
    }
    @objc func firstTextFieldChanged(){
        viewModel.firstNumber.value = firstTextField.text!
        viewModel.sumResult()
        viewModel.presentNumberFormat()
    }
    @objc func secondTextFieldChanged(){
        viewModel.secondNumber.value = secondTextField.text!
        viewModel.sumResult()
    }
    
}
/*
 var person = Person("상남")
 person.name = "고래밥"
 person.introduce { value in
     self.resultLabel.text = value
     self.view.backgroundColor = [.orange, .white,.blue,.green,.gray,.red].randomElement()!
 }
 DispatchQueue.main.asyncAfter(deadline: .now() + 2){
     self.person.name = "바나나"
 }
 DispatchQueue.main.asyncAfter(deadline: .now() + 4){
     self.person.name = "칙촉"
 }
 */
