//
//  Game.swift
//  hangman
//
//  Created by DPI Student 052 on 7/12/23.
//

import Foundation




struct Game {
    var word: String
    var wrongLeft: Int
    var guessed: [Character]
    
    mutating func playerGuessed(letter: Character){
        guessed.append(letter)
        if !word.contains(letter){
            wrongLeft -= 1
        }
    }
    
    var formatted: String{
        var guessedWord = ""
        for letter in word{
            if guessed.contains(letter){
                guessedWord += "\(letter)"
            }
            else{
                guessedWord += "_"
                
            }
        }
        return guessedWord
    }
    
}
