//
//  MainView.swift
//  Vocab
//
//  Created by Titouan Blossier on 03/02/2021.
//

import SwiftUI

/// This view is where the user select its options for the training.
struct MainView: View {
    @State private var originalLanguage : Language = .english
    @State private var translationLanguage : Language = .spanish
    @State var displayTrainingView : Bool = false
    
    var body: some View {
        VStack {
            Form {
                LanguagePicker(language: $originalLanguage, text: "Original Language")
                LanguagePicker(language: $translationLanguage, text: "Translation Language")
            }
            Spacer()
            ButtonView(text: "Start") {
                displayTrainingView = true
            }
            NavigationLink(
                destination: TrainingView(originalLanguage: originalLanguage, translationLanguage: translationLanguage),
                isActive: $displayTrainingView,
                label: {
                    EmptyView()
                })
            
            Text("By Titouan Blossier")
            
        }
        .navigationBarTitle("Vocab")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
                .preferredColorScheme(.dark)
        }
    }
}
