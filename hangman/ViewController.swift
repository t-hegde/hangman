//
//  ViewController.swift
//  hangman
//
//  Created by DPI Student 052 on 7/12/23.
//

import UIKit

class ViewController: UIViewController {
    var list = ["vixen", "glyph", "stoma", "xenon", "belis", "angry", "titer", "luter", "heron", "knack"]
    let wrongAllowed = 7
    var wins = 0{
        didSet{
            newRound()
        }
    }
    var losses = 0{
        didSet{
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    
    
    var currentGame: Game!
    func newRound(){
        if !list.isEmpty{
            let newWord = list.removeFirst()
            currentGame = Game(word: newWord, wrongLeft: wrongAllowed, guessed: [])
            enableLetterButtons(true)
            updateUI()
        }
        else{
            enableLetterButtons(false)
        }
        
    }
    
    func enableLetterButtons(_ enable: Bool) {
      for button in letterButtons {
        button.isEnabled = enable
      }
    }

    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func letterButtonPress(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()    }
    
    func updateGameState(){
        if currentGame.wrongLeft == 0 {
            losses += 1
          }
        else if currentGame.word == currentGame.formatted {
            wins += 1
          }
        else {
            updateUI()
          }
        
    }
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formatted {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")

        correctWord.text = wordWithSpacing
        score.text = "Wins: \(wins), Losses: \(losses)"
        treeImgView.image = UIImage(named: "Tree \(currentGame.wrongLeft)")
    }
    
    

    @IBOutlet var treeImgView: UIImageView!
    
    @IBOutlet var correctWord: UILabel!
    
    @IBOutlet var score: UILabel!
    
    

    
}

