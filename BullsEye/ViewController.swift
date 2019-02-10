//
//  ViewController.swift
//  BullsEye
//
//  Created by Tanin on 10/02/2019.
//  Copyright © 2019 landtanin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentVal = 0
    var targetVal = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentVal = Int(slider.value.rounded())
        startNewGame()
        
        let thumbImg = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImg, for: .normal)
        
        let thumbImgHiglighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImgHiglighted, for: .highlighted)
        
        let leftTrackInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let leftTrackImg = #imageLiteral(resourceName: "SliderTrackLeft")
        let leftTrackImgResizable = leftTrackImg.resizableImage(withCapInsets: leftTrackInset)
        slider.setMinimumTrackImage(leftTrackImgResizable, for: .normal)
        
        let rightTrackInset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let rightTrackImg = #imageLiteral(resourceName: "SliderTrackRight")
        let rightTrackImgResizable = rightTrackImg.resizableImage(withCapInsets: rightTrackInset)
        slider.setMaximumTrackImage(rightTrackImgResizable, for: .normal)
        
    }

    @IBAction func showAlert(_ sender: UIButton) {
        
        var point = 100 - abs(currentVal - targetVal)
        
        let title: String
        switch (point) {
        case 100:
            title = "Perfect"
            point+=100
        case 99:
            title = "You almost had it"
            point+=50
        case 95...98:
            title = "You almost had it!"
        case 90...94:
            title = "Pretty good"
        default :
            title = "Not even close"
        }
        
        score += point
        
        let alert = UIAlertController(title: title, message: "you scored \(point)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "alert title", style: .default,  handler: { action in
            self.restart()
        })
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    fileprivate func startNewGame() {
        round = 0
        score = 0
        restart()
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        
        startNewGame()
        
    }
    
    @IBAction func slider(_ sender: UISlider) {
        let roundedValue = sender.value.rounded()
        currentVal = Int(roundedValue)
    }
    
    func restart() {
        round += 1
        targetVal = Int.random(in: 1...100)
        currentVal = 50
        slider.value = Float(currentVal)
        updateLabels()
        
    }
    
    func updateLabels(){
        targetValLable.text = String(targetVal)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

