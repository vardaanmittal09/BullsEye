//
//  ViewController.swift
//  BullsEye
//
//  Created by Vardaan Mittal on 08/01/19.
//  Copyright © 2019 Vardaan Mittal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var score  = 0
    var round = 1
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let roundedValue=slider.value.rounded()
        currentValue=Int(roundedValue)
        startOver()
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlited = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlited, for: .highlighted)
        
        let insects = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftRisezable=trackLeftImage.resizableImage(withCapInsets: insects)
        
        slider.setMinimumTrackImage(trackLeftRisezable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightRisezable=trackRightImage.resizableImage(withCapInsets: insects)
        
        slider.setMaximum TrackImage(trackRightRisezable, for: .normal)
        
    }

    @IBAction func showAlert(){
        let difference = abs(targetValue-currentValue)
        let points = 100 - difference
        score += points
        round += 1
        let message = "You scored: \(points)"
        let alert=UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        let action=UIAlertAction(title: "OK", style: .default, handler:{
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction  func startOver(){
        score=0
        round=0
        startNewRound()
    }
    
    
    
    @IBAction func sliderMoved(slider : UISlider){
        print("The value of the slider is now: \(slider.value)");
        let roundedValue=slider.value.rounded();
        currentValue=Int(roundedValue);
    }
    
    func startNewRound(){
        targetValue=Int.random(in: 1...100)
        currentValue=50
        slider.value=Float(currentValue)
        updateLabels()
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text=String(score)
        roundLabel.text=String(round)
    }
    
}

