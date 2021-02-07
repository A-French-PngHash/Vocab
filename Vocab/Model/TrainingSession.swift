//
//  Training.swift
//  Vocab
//
//  Created by Titouan Blossier on 03/02/2021.
//

import Foundation

/// This class is responsible for managing a training session.
class TrainingSession {
    let wordService = WordService.shared
    var currentIndex : Int
    var currentWord : Word!

    init(categories : Array<Category> = [.all]) {
        self.currentIndex = 1
        wordService.loadWords(category: categories)
        pickWord(lastOneSuccessful: nil)
    }

    /// Pick a random word from the word list and set it as the currentWord variable of this class.
    ///
    /// - parameter lastOneSuccessful: Wether or not the user answered good to the previous word.
    /// If set to nil then doesn't change the previous word's value (useful on init when currentWord is nil).
    func pickWord(lastOneSuccessful : Bool?){
        if let success = lastOneSuccessful {
            self.currentWord.userAnsweredSuccesful = success
        }
        var probabilities : Array<Double> = []
        for i in wordService.words {
            probabilities.append(Double(i.score(index: currentIndex)))
        }
        self.currentWord = randomElement(of: wordService.words, probabilities: probabilities)
        currentIndex += 1
        self.currentWord.lastPickedAtIndex = currentIndex
    }

    private func randomElement<T>(of array: Array<T>, probabilities: [Double]) -> T {
        // Sum of all probabilities (so that we don't have to require that the sum is 1.0):
        let sum = probabilities.reduce(0, +)
        // Random number in the range 0.0 <= rnd < sum :
        let rnd = Double.random(in: 0.0 ..< sum)
        // Find the first interval of accumulated probabilities into which `rnd` falls:
        var accum = 0.0
        for (i, p) in probabilities.enumerated() {
            accum += p
            if rnd < accum {
                return array[i]
            }
        }
        // This point might be reached due to floating point inaccuracies:
        return array[probabilities.count - 1]
    }
}
