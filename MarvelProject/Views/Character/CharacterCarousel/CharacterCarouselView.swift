//
//  CharacterSoloView.swift
//  MarvelProject
//
//  Created by Ben Clark on 07/08/2023.
//

import SwiftUI

struct CharacterSoloView: View {
    var body: some View {
        VStack {
            // Image
            // Name & Favourite
            // Description
            // Comics List
            // Marvel Link
            HStack(spacing: 30) {
                // Site
                Link(destination: URL(string: "https://www.google.com")!) {
                    LinkIconView(systemName: "desktopcomputer", text: "")
                }
                
                // Wiki
                Link(destination: URL(string: "https://www.google.com")!) {
                    LinkIconView(systemName: "globe", text: "")

                }
                
                Link(destination: URL(string: "https://www.google.com")!) {
                    LinkIconView(systemName: "books.vertical.fill", text: "Site")
                }

            }
            .font(.footnote).bold()
        }
    }
}

struct CharacterSoloView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterSoloView()
    }
}
