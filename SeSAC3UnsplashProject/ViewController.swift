//
//  ViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var changeButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nickNameTextField.placeholder = "nickname_placeholder".localized
//        let value = NSLocalizedString("nickname_result", comment: "")
//        resultLabel.text = String(format: value, "고래밥")
        
        resultLabel.text = "age_result".localized(number: 50)
    }


}

