//
//  TextViewViewController.swift
//  uikit
//
//  Created by Farid Hacizade on 11.09.23.
//

import UIKit

class TextViewViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var descriptionTV: UITextView!
    var toTopButton = UIButton()
    var mode = Mode.edit
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTF.delegate = self
        
        titleTF.borderStyle = .none
        titleTF.layer.borderWidth = 1
        titleTF.layer.cornerRadius = 10
        titleTF.layer.borderColor = UIColor.gray.cgColor
        
        
        descriptionTV.layer.borderWidth = 1
        descriptionTV.layer.cornerRadius = 10
        descriptionTV.layer.borderColor = UIColor.gray.cgColor
        descriptionTV.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        descriptionTV.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        view.addSubview(toTopButton)
        toTopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toTopButton.topAnchor.constraint(equalTo: descriptionTV.bottomAnchor, constant: 20),
            toTopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            toTopButton.heightAnchor.constraint(equalToConstant: 20),
            toTopButton.widthAnchor.constraint(equalToConstant:100),
            
        ])
        toTopButton.setTitle("to top", for: .normal)
        toTopButton.setTitleColor(.blue, for: .normal)
        toTopButton.addTarget(self, action: #selector(toTop), for: .touchUpInside)
        
    }
    

    @objc func toTop(){
        descriptionTV.scrollRangeToVisible(NSRange( location: 0, length:0))
        
    }
    
    @objc func buttonAction(_ sender:UIButton){
        mode.togle()
        let buttonTitle = mode == .preview ? "Edit" : "Preview"
        let toValue: CGFloat = mode == .preview ? 0 : 1
        
        UIView.animate(withDuration: 1){
            sender.setTitle(buttonTitle, for: .normal)
        }
        
        titleTF.animateBorderWidth(toValue: toValue, duration: 0.5)
        descriptionTV.animateBorderWidth(toValue: toValue, duration: 0.5)
        descriptionTV.isEditable = mode == .edit
        
        
        
    }
}

extension UIView{
    func animateBorderWidth(toValue:CGFloat, duration:Double){
        let animation: CABasicAnimation = CABasicAnimation(keyPath:"borderWidth")
        animation.fromValue = layer.borderWidth
        animation.toValue = toValue
        layer.add(animation, forKey: "width")
        layer.borderWidth = toValue
    }
}

enum Mode{
    case preview
    case edit
    mutating func togle(){
        switch self {
        case .preview: self = .edit
        case .edit: self = .preview
        }
    }
}
