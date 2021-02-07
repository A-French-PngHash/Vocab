//
//  LanguagePicker.swift
//  Vocab
//
//  Created by Titouan Blossier on 03/02/2021.
//

import SwiftUI

struct LanguagePicker: View {
    @Binding var language : Language
    var text : String

    var body: some View {
        Picker(selection: $language, label: Text(text), content: {
            ForEach(Language.allCases, id: \.self) { (i) in
                Text(i.name).tag(i)
            }
        })
    }
}

struct LanguagePicker_Previews: PreviewProvider {
    @State static var language = Language.english
    static var previews: some View {
        LanguagePicker(language: $language, text: "Original Language")
    }
}
