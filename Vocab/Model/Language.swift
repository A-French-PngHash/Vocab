//
//  Language.swift
//  Vocab
//
//  Created by Titouan Blossier on 02/02/2021.
//

import Foundation

enum Language : CaseIterable{
    case french, english, spanish

    var name : String {
        switch self{
        case .english:
            return "English 🇬🇧"
        case .french:
            return "French 🇫🇷"
        case .spanish:
            return "Spanish 🇪🇸"
        }
    }
}
