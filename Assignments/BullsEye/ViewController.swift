//
//  ViewController.swift
//  BullsEye
//
//  Created by Abimael Reyes Lopez on 2/7/18.
//  Copyright © 2018 Abimael Reyes Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var targetValue = 0
    @IBOutlet weak var slider: UISlider!
    var currentValue = 0
    var score = 0
    var round = 0
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable =
                        trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        
        let title: String
        if difference == 0{
            title = "Wow! Great job!"
            points += 100
        }else if difference == 1{
            title = "By a hair!"
            points += 50
        }else if difference < 5{
            title = "Almost! Missed by " + String(difference)
            points += 25
        }else if difference < 10{
            title = "Nope!"
        }else if difference < 20{
                title = "Sweet Lord of the rings!"
        }else {
            title = "Are you feeling ok?"
        }
        score += points
        
        let message = "You scored \(points) points"
                      "\nThe value of the slider is: \(currentValue)" +
                      "\nThe target value is: \(targetValue)" +
                       "\nThe difference is: \(difference)"
        
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: { action in
                                                    self.startNewRound()
                                            })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound() 
    }
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
}




