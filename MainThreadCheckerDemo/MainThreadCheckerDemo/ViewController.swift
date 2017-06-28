//
//  ViewController.swift
//  MainThreadCheckerDemo
//
//  Created by Aaron Morse on 6/28/17.
//  Copyright © 2017 Aaron Morse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var counterLabel: UILabel!
    
    var counter : Int = 0
    
    func updateCounterLabel (count: Int) {
        self.counterLabel.text = String(count)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        counter+=1
        
        DispatchQueue.global(qos: .background).async { [weak self, counter] in
            print("This is run on the background queue")
            sleep(1)
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.updateCounterLabel(count: counter)
        }
    }
    
}

