//
//  ViewController.swift
//  uikit
//
//  Created by Farid Hacizade on 01.09.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!
    var segmentedControl: UISegmentedControl!
    
    let imageSize = CGSize(width: 250, height: 300)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cats = ["Cat1", "Cat2", "Cat3"]
        segmentedControl = UISegmentedControl(items: cats)
        
        catImageView.contentMode = .scaleAspectFill
        
        segmentedControl.addTarget(self, action: #selector(segmentedAction(sender:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            catImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            catImageView.widthAnchor.constraint(equalToConstant: imageSize.width),
            catImageView.heightAnchor.constraint(equalToConstant: imageSize.height)
        ])
        
        changeCat(for: 2)
    }
    
    @objc func segmentedAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: changeCat(for: 1)
        case 1: changeCat(for: 2)
        case 2: changeCat(for: 3)
        default: break
        }
    }
    
    func changeCat(for index: Int) {
        if let image = UIImage(named: "\(index)") {
            let resizedImage = image.resize(to: imageSize)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.catImageView.alpha = 0
            }) { _ in
                UIView.animate(withDuration: 0.5) {
                    self.catImageView.alpha = 1
                    self.catImageView.image = resizedImage
                }
            }
        }
    }
}

extension UIImage {
    // Метод для изменения размера изображения
    func resize(to size: CGSize) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
