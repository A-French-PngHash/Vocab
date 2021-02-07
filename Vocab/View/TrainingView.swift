//
//  TrainingView.swift
//  Vocab
//
//  Created by Titouan Blossier on 02/02/2021.
//

import SwiftUI

struct TrainingView: View {

    var originalLanguage : Language
    var translationLanguage : Language
    @State var userInput : String = ""
    @State var userWasCorrect : Bool = true
    /// Set to true when the user press the validate button.
    @State var userAnswered : Bool = false

    let session = TrainingSession()

    var body: some View {
        VStack {
            Text("Translate in \(translationLanguage.name) the word : ")
                .fontWeight(.thin)
                .padding(.top)
            Text(session.currentWord.wordForLanguage(originalLanguage).lowercased().capitalized)
                .font(.title)
                .fontWeight(.medium)
            TextField("Translation", text: $userInput)
                .padding()
                .disableAutocorrection(true)
            Spacer()
            if userAnswered {
                if userWasCorrect {
                    CorrectView {
                        nextWord(correct: true)
                    }
                } else {
                    IncorrectView(userInput: $userInput, correctAnswer: self.session.currentWord.wordForLanguage(translationLanguage), nextButtonTaped: {
                            nextWord(correct: false)
                    })
                }
            } else {
                Spacer()
                ButtonView(text: "Validate") {
                    userWasCorrect = session.currentWord.wordForLanguage(translationLanguage).lowercased() == userInput.lowercased()
                    withAnimation {
                        userAnswered = true
                    }
                }
            }

            Spacer()
            
        }
        .navigationBarTitle("Training", displayMode: .inline)
    }

    func nextWord(correct: Bool) {
        session.pickWord(lastOneSuccessful: correct)
        withAnimation {
            self.userInput = ""
            self.userAnswered = false
        }
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrainingView(originalLanguage: .french, translationLanguage : .spanish)
                .preferredColorScheme(.dark)
        }
    }
}
