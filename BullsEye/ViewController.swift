//
//  ViewController.swift
//  BullsEye
//
//  Created by Wilfred Asomani on 05/04/2020.
//  Copyright © 2020 Wilfred Asomani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider?
    @IBOutlet weak var targetLabel: UILabel?
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var roundLabel: UILabel?
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad();

        let normalThumbImage = UIImage(named: "SliderThumb-Normal") // uiimage is nullable
        let highlightedThumbImage = UIImage(named: "SliderThumb-Highlighted")
        slider?.setThumbImage(normalThumbImage, for: .normal)
        slider?.setThumbImage(highlightedThumbImage, for: .highlighted)
        
        var trackLeftImage = UIImage(named: "SliderTrackLeft")
        var trackRightImage = UIImage(named: "SliderTrackRight")
        let insets = UIEdgeInsets(top: 0.0, left: 14.0, bottom: 0.0, right: 14.0)
        trackLeftImage = trackLeftImage?.resizableImage(withCapInsets: insets)
        trackRightImage = trackRightImage?.resizableImage(withCapInsets: insets)
        slider?.setMinimumTrackImage(trackLeftImage, for: .normal)
        slider?.setMaximumTrackImage(trackRightImage, for: .normal)
        
        startNewGame()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        if difference == 0 { points += 100 }
        else if difference == 1 { points += 50 }
        score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: generateTitle(difference), message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in self.startNewRound() })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // action methods can take a parameter which is the UIControl which trigered the action.
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    func generateTitle(_ difference: Int) -> String {
        switch difference {
        case 0:
            return "Perfect!"
        case let x where x < 5:
            return "Almost had it!"
        case let x where x < 10:
            return "Pretty good!"
        default:
            return "Not even close!"
        }
    }
    
    func startNewRound() {
        let transition = CATransition()
        transition.type = .fade // or CATransitionType.Fade
        transition.timingFunction = CAMediaTimingFunction(name: .easeIn)
        view?.layer.add(transition, forKey: nil)

        targetValue = Int.random(in: 1...100) // between 1 and 100 inclusive 1..<100 is 1...99
        currentValue = (100 - targetValue) / 2
        slider?.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel?.text = String(targetValue)
        scoreLabel?.text = String(score)
        roundLabel?.text = String(round)
    }
}
