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
        case three = 3
        static func getRandomCard() -> WinningCard {
            let newNum = Int(arc4random_uniform(4))
            return WinningCard(rawValue: newNum)!
        }
    }
    
    var winningCardNum: WinningCard? = nil
    var cards: [UIButton] = []
    
    @IBOutlet weak var cardZero: UIButton!
    @IBOutlet weak var cardOne: UIButton!
    @IBOutlet weak var cardTwo: UIButton!
    @IBOutlet weak var cardThree: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set up any of your own things
        setUpGame()
        self.cards = [cardZero, cardOne, cardTwo, cardThree]
    }
    
    @IBAction func newGameButtonPressed(_ sender: UIButton) {
        setUpGame()
    }
    
    func setUpGame() {
        self.winningCardNum = WinningCard.getRandomCard()
        resetCards()
        displayLabel.text = "Pick a card, any card!"
    }
    
    @IBAction func cardButtonPressed(_ sender: UIButton) {
        setWinningCardImage()
        
        if sender.tag == winningCardNum?.rawValue {
            displayLabel.text = "You win!"
        } else {
            sender.setImage(#imageLiteral(resourceName: "threeCard"), for: .normal)
            displayLabel.text = "You lose!"
        }
        
        disableCards()
    }
    /*
    func pickWinningCard() {
        let newNum = Int(arc4random_uniform(3))
        //print("Trying to set to: \(newNum)")
        winningCardNum = WinningCard(rawValue: newNum)
    }
    */
    func resetCards() {
        for card in cards {
            card.setImage(#imageLiteral(resourceName: "cardBackRed"), for: .normal)
            card.isEnabled = true
        }
    }
    
    func setWinningCardImage() {
        guard let winningCardNum = winningCardNum else {
            return
        }
        switch winningCardNum {
        case .zero:
            cardZero.setImage(#imageLiteral(resourceName: "kingCard"), for: .normal)
        case .one:
            cardOne.setImage(#imageLiteral(resourceName: "kingCard"), for: .normal)
        case .two:
            cardTwo.setImage(#imageLiteral(resourceName: "kingCard"), for: .normal)
        case .three:
            cardThree.setImage(#imageLiteral(resourceName: "kingCard"), for: .normal)
        }
    }
    
    func disableCards() {
        for card in cards {
            card.isEnabled = false
        }
    }
}

