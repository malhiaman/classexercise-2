/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue: Int!
    var score = 0
    var round = 0

    @IBOutlet weak var targetValueLabel: UILabel!

    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var scoreLabel: UILabel!


    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        updateLabels()
        startNewGame()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert(_ sender: UIButton) {
        //collect user input
        currentValue = Int(slider.value)

        let diff = abs(targetValue - currentValue)
        var point = 0

        var msg = " "

        if(diff <= 3) {
            point = 5
            msg = "Excellent"
        } else if (diff <= 5) {
            point = 3
            msg = "Good job!"
        } else if (diff <= 10) {
            point = 1
            msg = "You got a point"
        } else {
            point = 0
            msg = "Try it again"
        }
        score += point
        let alert = UIAlertController(title: "Result", message: "\(msg) your point is: \(point)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in

            self.updateLabels()
            self.startNewGame()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func startOver(_ sender: UIButton) {
        //reset score and round
        score = 0
        round = 0
        //update labels
        updateLabels()
        //startNewGame
        startNewGame()
    }
    

    func startNewGame() {
        round += 1
        targetValue = Int(arc4random_uniform(100)) + 1
        targetValueLabel.text = String(targetValue)
        slider.value = 50

    }
    func updateLabels() {
        self.scoreLabel.text = String(self.score)
        roundLabel.text = String(round)
    }


}
