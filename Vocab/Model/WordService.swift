//
//  WordService.swift
//  Vocab
//
//  Created by Titouan Blossier on 02/02/2021.
//

import Foundation

class WordService {
    static let shared = WordService()
    private init() { }

    var words : Array<Word> = []

    /// Load the words from the json file (wordPairs.json) into an array of Word named words.
    ///
    /// - parameter category: Word categories to load. By default set to load all categories.
    func loadWords(category : Array<Category> = [.all]){
        guard let path = Bundle.main.path(forResource: "wordPairs", ofType: "json") else {
            return
        }
        let fileUrl = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: fileUrl, options: .mappedIfSafe),
              let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Dictionary<String, Dictionary<String, Dictionary<String, String>>> else {
            return
        }

        for (name, content) in json {
            // Going through the categories in the json file..
            var loadCategory = category.contains(.all)
            if !loadCategory {
                // Category list doesn't contain .all. Maybe the category is to load, maybe not.
                for i in category {
                    if i.rawValue.lowercased() == name.lowercased() {
                        // We have to load the category.
                        loadCategory = true
                        break
                    }
                }
            }

            if loadCategory {
                for value in content.values {
                    guard let french = value["french"], let english = value["english"], let spanish = value["spanish"] else {
                        return
                    }
                    words.append(Word(english: english, french: french, spanish: spanish))
                }
            }
        }
    }
}
