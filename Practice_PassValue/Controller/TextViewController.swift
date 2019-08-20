//
//  TextViewController.swift
//  Practice_PassValue
//
//  Created by yueh on 2019/8/20.
//  Copyright © 2019 yueh. All rights reserved.
//

import UIKit

protocol TextViewControllerDelegate: class {
    
//    func passText() -> String
    
}

class TextViewController: UIViewController {
    
    let textField = UITextField()
    
    let clickCheckBtn = UIButton()
    
    var text: String?
    
    var handler: ((String) -> Void)?
    
    weak var delegate: TextViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textField)
        view.addSubview(clickCheckBtn)
        setTextField()
        setBtnLayout()
        
        textField.text = text
        
        clickCheckBtn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)

    }
    
    func setTextField(){
        
        textField.borderStyle = .line
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 100),
            textField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 2/3),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
    }

    func setBtnLayout(){
        
        clickCheckBtn.setTitle("Check", for: .normal)
        
        clickCheckBtn.backgroundColor = .black
        
        clickCheckBtn.setTitleColor(.white, for: .normal)
        
        clickCheckBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            clickCheckBtn.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -20),
            
            clickCheckBtn.heightAnchor.constraint(equalToConstant: 40),
            clickCheckBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 2/3),
            
            clickCheckBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            
            ])
        
    }
    
    @objc func clickBtn(){

        guard let text = textField.text else {
            return
        }

        handler?(text)

        navigationController?.popViewController(animated: true)
    }
//    
//    @objc func clickBtn(){
//    
//        navigationController?.popViewController(animated: true)
//    }
//    
}

