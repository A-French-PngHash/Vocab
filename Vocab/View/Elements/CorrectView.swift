//
//  CorrectView.swift
//  Vocab
//
//  Created by Titouan Blossier on 03/02/2021.
//

import SwiftUI

struct CorrectView: View {
    let checkColor = Color(UIColor(red:61/255.0, green:217/255.0, blue:97/255.0, alpha:1.0))
    let correctColor = Color(UIColor(red:1/255.0, green:179/255.0, blue:2/255.0, alpha:1.0))
    let nextButtonPressed : () -> Void

    var body: some View {
        VStack {
            Text("Correct !")
                .foregroundColor(correctColor)
                .font(.system(size: 40))
                .fontWeight(.bold)
            Image(systemName: "checkmark")
                .foregroundColor(checkColor)
                .font(.system(size: 80))
            ButtonView(text: "Next") {
                nextButtonPressed()
            }
        }
    }
}

struct CorrectView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectView(nextButtonPressed: { })
            .preferredColorScheme(.dark)
    }
}
