//
//  TabItemView.swift
//  MarvelProject
//
//  Created by Ben Clark on 09/08/2023.
//

import SwiftUI

struct TabItemView: View {
    let imagePath: String
    let text: String
    var body: some View {
        VStack {
            Image(systemName: imagePath)
            Text(text.capitalized)
        }
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        let imagePath = "list.bullet.circle.fill"
        let text = "list"
        TabItemView(imagePath: imagePath, text: text)
    }
}
