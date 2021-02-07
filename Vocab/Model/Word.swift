//
//  Word.swift
//  Vocab
//
//  Created by Titouan Blossier on 02/02/2021.
//

import Foundation

class Word : Codable {
    var english : String
    var french : String
    var spanish : String

    /// Index this word was picked at the last time.
    var lastPickedAtIndex = 0
    /// Wether or not the user got thhis word right last time it was picked.
    var userAnsweredSuccesful = true

    init(english : String, french : String, spanish : String) {
        self.english = english
        self.french = french
        self.spanish = spanish
    }

    /// Returns the score for this word. The score is a number enabling the calculation of the probability of this word being picked.
    ///
    /// If the last time the word was picked, the user answered succesfully then this is the number of word picked since.
    /// Otherwise, it the user answered wrong then this is the number of word picked since times the number of words divided by 2.
    func score(index: Int) -> Int{
        let numberOfWordPickedSince = index - lastPickedAtIndex
        if userAnsweredSuccesful {
            return numberOfWordPickedSince
        } else {
            return (numberOfWordPickedSince * WordService.shared.words.count) / 2
        }
    }

    func wordForLanguage(_ language : Language) -> String{
        switch language {
        case .english:
            return english
        case .french:
            return french
        case .spanish:
            return spanish
        }
    }
}
