//
//  ViewController.swift
//  Yuriko-Uchida_COMP2125-Sec001_Lab3-Ex02
//
//  Created by user212402 on 2022-07-13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func calculateTips(_ sender: UISlider) {
        //Slider value
        let sliderVal = Int(sender.value);
        tipSliderLabel.text = "Custom Tip Percentage: \(sliderVal)%";
        customPercentLabel.text = "\(sliderVal)%";
        
        //The bill amount ($), tip (%)
        let customTipPercent = Double(sliderVal) / 100.0;
        var billAmount = billAmountText.text!;
        //Remove $ symbol to calculate
        let removeChr: Set<Character> = ["$"]
        billAmount.removeAll(where: {removeChr.contains($0)})

        //Formatter to show the amount as currency
        let formatter = NumberFormatter();
        formatter.numberStyle = .currency;
        
        //Calculate each tip and total amount, unless the bill amount is empty
        if (!billAmount.isEmpty) {
            // format the bill amount
            let billAmountDouble = Double(billAmount)!;
            let billAmountNS = NSNumber(value: billAmountDouble);

            //tip: 15%
            let fifteenPercentTip = billAmountDouble * 0.15;
            let fifteenPercentTotal = billAmountDouble + fifteenPercentTip;
            let fifteenPercentTipNS = NSNumber(value: fifteenPercentTip);
            let fifteenPercentTotalNS = NSNumber(value: fifteenPercentTotal);
            fifteenTipLabel.text = formatter.string(from: fifteenPercentTipNS)!;
            fifteenTotalLabel.text = formatter.string(from: fifteenPercentTotalNS)!;

            //tip: custom
            let customTip = billAmountDouble * customTipPercent;
            let customTotal = billAmountDouble + customTip;
            let customTipNS = NSNumber(value: customTip);
            let customTotalNS = NSNumber(value: customTotal);
            customPercentTipLabel.text = formatter.string(from: customTipNS)!;
            customPercentTotalLabel.text = formatter.string(from: customTotalNS)!;
            billAmountText.text = formatter.string(from: billAmountNS)!
        } else {
            //If there is no bill amount, clear all Labels
            customPercentLabel.text = "Custom Tip";
            customPercentTipLabel.text = "";
            customPercentTotalLabel.text = "";
            fifteenTipLabel.text = "";
            fifteenTotalLabel.text = "";
        }
    }

    //Variables
    @IBOutlet weak var tipSliderLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var customPercentLabel: UILabel!
    @IBOutlet weak var billAmountText: UITextField!
    @IBOutlet weak var fifteenTotalLabel: UILabel!
    @IBOutlet weak var fifteenTipLabel: UILabel!
    @IBOutlet weak var customPercentTipLabel: UILabel!
    @IBOutlet weak var customPercentTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Show keypad
        billAmountText.becomeFirstResponder();

    }


}

