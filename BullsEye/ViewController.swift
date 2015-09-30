//
//  ViewController.swift
//  BullsEye
//
//  Created by Nathan Stilwell on 9/17/15.
//  Copyright © 2015 Nathan Stilwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let sliderResetValue = 50
  let maxPoints = 100
  let bonusPoints = 100
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0

  //
  // Interface Builder Elements
  //
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!

  //
  // Utility Functions
  //  
  
  func startNewRound () {
    round += 1
    targetValue = 1 + Int(arc4random_uniform(100))
    updateLabels()
    resetSlider()
  }
  
  func updateLabels () {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  func resetSlider () {
    slider.value = Float(sliderResetValue)
  }
  
  func calculateScore (diff: Int) -> Int {
    switch diff {
    case 0:
      return (maxPoints - diff) + bonusPoints
    default:
      return maxPoints - diff
    }
  }
  
  func generateAlertTitle (diff: Int) -> String {
    switch diff {
      case 0:
        return "Perfect"
      case 1..<5:
        return "So Close"
      case 5..<10:
        return "Not Bad"
      default:
        return "Not even ..."
    }
  }
  
  //
  // Interface Builder Actions
  //
  
  @IBAction func startNewGame () {
    round = 0;
    score = 0;
    startNewRound()
  }

  
  @IBAction func showAlert () {
    let valueDifference = abs(currentValue - targetValue)
    let points = calculateScore(valueDifference)
    let message = "You scored \(points) points"
    let alertTitle = generateAlertTitle(valueDifference)
    
    score += points
    
    let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "whatever.", style: .Default, handler: { action in
      self.startNewRound()
    })
    
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(slider: UISlider) {
    currentValue = lroundf(slider.value)
  }

  //
  // --- App Starts Here -----
  //
  override func viewDidLoad() {
    super.viewDidLoad()
//    currentValue = lroundf(slider.value);
    startNewGame()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

