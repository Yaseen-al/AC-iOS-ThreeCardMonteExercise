//
//  ViewController.swift
//  ThreeCardMonteV2
//
//  Created by C4Q  on 10/15/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum WinningCard: Int {
        case zero = 0
        case one = 1
        case two = 2
    }
    
    var winningCardNum: WinningCard? = nil

    @IBOutlet weak var cardZero: UIButton!
    @IBOutlet weak var cardOne: UIButton!
    @IBOutlet weak var cardTwo: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        setUpGame()
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        setUpGame()
    }
    
    func setUpGame() {
        pickWinningCard()
        resetCards()
        displayLabel.text = "Pick a card, any card!"
    }
    
    @IBAction func cardButtonPressed(_ sender: UIButton) {
        setWinningCardImage()
        if sender.tag == winningCardNum?.rawValue {
            displayLabel.text = "You win!"
        } else {
            sender.setImage(#imageLiteral(resourceName: "threeCard"), for: .normal)
            sender.setBackgroundImage(nil, for: .normal)
            displayLabel.text = "You lose!"
        }
        disableCards()
    }
    
    func pickWinningCard() {
        let newNum = Int(arc4random_uniform(3))
        print("Trying to set to: \(newNum)")
        winningCardNum = WinningCard(rawValue: newNum)
    }
    
    func resetCards() {
        cardZero.setBackgroundImage(#imageLiteral(resourceName: "cardBackRed"), for: .normal)
        cardZero.setImage(nil, for: .normal)
        cardZero.isEnabled = true

        cardOne.setBackgroundImage(#imageLiteral(resourceName: "cardBackRed"), for: .normal)
        cardOne.setImage(nil, for: .normal)
        cardOne.isEnabled = true

        cardTwo.setBackgroundImage(#imageLiteral(resourceName: "cardBackRed"), for: .normal)
        cardTwo.setImage(nil, for: .normal)
        cardTwo.isEnabled = true
    }
    
    func setWinningCardImage() {
        guard let winningCardNum = winningCardNum else {
            return
        }
        switch winningCardNum {
        case .zero:
            cardZero.setImage(#imageLiteral(resourceName: "kingCard"), for: .normal)
            cardZero.setBackgroundImage(nil, for: .normal)
        case .one:
            cardOne.setImage(#imageLiteral(resourceName: "kingCard"), for: .normal)
            cardOne.setBackgroundImage(nil, for: .normal)
        case .two:
            cardTwo.setImage(#imageLiteral(resourceName: "kingCard"), for: .normal)
            cardTwo.setBackgroundImage(nil, for: .normal)
        }
    }
    
    func disableCards() {
        cardZero.isEnabled = false
        cardOne.isEnabled = false
        cardTwo.isEnabled = false
    }
}

