//
//  WhiteBackgroundButton.swift
//  SeSAC3UnsplashProject
//
//  Created by 이상남 on 2023/09/12.
//

import UIKit

class WhiteBackgroundButton: UIButton{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(){
        backgroundColor = .white
        layer.cornerRadius = 8
    }
    
    func setImageAndTitle(imageName: String? = nil, title: String){
        if let imageName {
            let image =  UIImage(systemName: imageName)
            setImage(image, for: .normal)
            tintColor = .black
        }
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
    }
    
}
