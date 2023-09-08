//
//  SliderViewController.swift
//  uikit
//
//  Created by Farid Hacizade on 07.09.23.
//

import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var commonAmountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var amountSlider: UISlider!
    @IBOutlet weak var periodSlider: UISlider!
    @IBOutlet weak var percentSlider: UISlider!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
      commonAmountLabel.text = "Calculator"
        amountLabel.text = "10000 $"
        periodLabel.text = "5 month"
        percentLabel.text = "5 %"
        setCommonAmount()
    }
    
    
    @IBAction func amountSliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0: amountLabel.text = "\(Int(sender.value)) $"
        case 1: periodLabel.text = "\(Int(sender.value))  month"
        case 2: percentLabel.text = "\(Int(sender.value)) %"
        default:
            return
        }
        
        setCommonAmount()
    }
   
    func setCommonAmount(){
        let percentAmount = amountSlider.value / 100 * percentSlider.value / 12
        let periodAmount = percentAmount * periodSlider.value
        commonAmountLabel.text = "\(amountSlider.value + periodAmount) $"
    }
}
