//
//  ViewController.swift
//  DiceApp
//
//  Created by Arman Myrzakanurov on 09.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var dice3: UIImageView!
    @IBOutlet weak var dice4: UIImageView!
    @IBOutlet weak var dice5: UIImageView!
    @IBOutlet weak var rolButton: UIButton!
    
    @IBOutlet weak var dice1Label: UILabel!
    @IBOutlet weak var dice2Label: UILabel!
    @IBOutlet weak var dice3Label: UILabel!
    @IBOutlet weak var dice4Label: UILabel!
    @IBOutlet weak var dice5Label: UILabel!

    let diceImages: [UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")] // #imageLiteral()
    let diceImagesEnum: [UIImage] = [
        .diceOne, .diceTwo, .diceThree, .diceFour, .diceFive, .diceSix
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialDice()
        setupButton()
        setupLabels()
    }
    
    private func setupInitialDice() {
        dice1.image = .diceOne
        dice2.image = .diceTwo
        dice3.image = .diceThree
        dice4.image = .diceFour
        dice5.image = .diceFive
    }
    
    private func setupButton() {
        rolButton.layer.cornerRadius = 16
        rolButton.backgroundColor = .systemTeal
        rolButton.setTitle("Roll All Dice", for: .normal)
        rolButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    private func setupLabels() {
        let labels = [dice1Label, dice2Label, dice3Label, dice4Label, dice5Label]
        labels.forEach { label in
            label?.textAlignment = .center
            label?.font = UIFont.boldSystemFont(ofSize: 16)
            label?.textColor = .white
            label?.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            label?.layer.cornerRadius = 8
            label?.clipsToBounds = true
        }
    }

    @IBAction func rollButtonDidTap(_ sender: UIButton) {
        rollAllDice()
    }
    
    private func rollAllDice() {
        let diceImageViews = [dice1, dice2, dice3, dice4, dice5]
        let diceLabels = [dice1Label, dice2Label, dice3Label, dice4Label, dice5Label]
        
        for (index, diceImageView) in diceImageViews.enumerated() {
            let randomIndex = Int.random(in: 0..<diceImages.count)
            let randomImage = diceImages[randomIndex]
            let diceValue = randomIndex + 1
            
            diceImageView?.image = randomImage
            diceLabels[index]?.text = "\(diceValue)"
        }
    }
}
