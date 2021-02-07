//
//  IncorrectView.swift
//  Vocab
//
//  Created by Titouan Blossier on 04/02/2021.
//

import SwiftUI

struct IncorrectView: View {
    @Binding var userInput : String
    let correctAnswer : String
    let nextButtonTaped : () -> Void

    var body: some View {
        VStack {
            Text("Incorrect...")
                .font(.system(size: 30))
                .foregroundColor(.red)
                .fontWeight(.bold)
            Image(systemName: "xmark")
                .font(.system(size: 60))
                .foregroundColor(.red)
            Text("The correct answer was : ")

            Text(correctAnswer.lowercased().capitalized)
            .font(.title)
            .fontWeight(.medium)
            ButtonView(text: "Next") {
                nextButtonTaped()
            }
            .disabled(userInput.lowercased() != correctAnswer.lowercased())
        }
    }
}

struct IncorrectView_Previews: PreviewProvider {
    @State static var input = ""
    static var previews: some View {
        IncorrectView(userInput: $input, correctAnswer: "test", nextButtonTaped: { })
    }
}
