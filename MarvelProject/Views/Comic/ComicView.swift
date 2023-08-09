//
//  ComicView.swift
//  MarvelProject
//
//  Created by Ben Clark on 04/08/2023.
//

import SwiftUI

struct ComicView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.gray)
            .opacity(0.3)
            .cornerRadius(8)
            .frame(width: 150, height: 190)
    }
}

struct ComicView_Previews: PreviewProvider {
    static var previews: some View {
        ComicView()
    }
}
