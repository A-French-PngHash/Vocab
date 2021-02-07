//
//  VocabApp.swift
//  Vocab
//
//  Created by Titouan Blossier on 02/02/2021.
//

import SwiftUI

@main
struct VocabApp: App {
    /// Green to yellowish gradient.
    static let gradient = Gradient(colors: [
        Color(UIColor(red:17/255.0, green:157/255.0, blue:138/255.0, alpha:1.0)),
        Color(UIColor(red:71/255.0, green:218/255.0, blue:136/255.0, alpha:1.0))
    ])
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
