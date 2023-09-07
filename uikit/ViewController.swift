//
//  ViewController.swift
//  uikit
//
//  Created by Farid Hacizade on 01.09.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        let image = UIImage(named: "1")
//
//        imageView.animationDuration = 12
//        imageView.animationImages = [UIImage(named:"1")!]
//        imageView.startAnimating()
        
        
        
    }


}

  
