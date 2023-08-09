//
//  LinkIconView.swift
//  MarvelProject
//
//  Created by Ben Clark on 09/08/2023.
//

import SwiftUI

struct LinkIconView: View {
    let systemName: String
    let text: String
    var body: some View {
        VStack {
            Image(systemName: systemName)
                .padding(8)
                .background {
                }
            Text("\(text.capitalized)")
                .font(.caption2)
                .bold()
        }
        .foregroundColor(.black)
    }
}

struct LinkIconView_Previews: PreviewProvider {
    static var previews: some View {
        let systemName = "globe"
        let text = "external site"
        LinkIconView(systemName: systemName, text: text)
    }
}
