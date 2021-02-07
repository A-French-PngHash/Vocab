//
//  ButtonView.swift
//  Vocab
//
//  Created by Titouan Blossier on 04/02/2021.
//

import SwiftUI

struct ButtonView: View {
    var text : String
    var onClick : () -> Void

    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            Text(text)
                .foregroundColor(.white)
                .font(Font.system(size: 18))
        })
        .padding()
        .padding(.horizontal, 15)
        .background(LinearGradient(gradient: VocabApp.gradient, startPoint: .leading, endPoint: .trailing))
        .cornerRadius(22)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Start") { }
            .preferredColorScheme(.dark)
    }
}
