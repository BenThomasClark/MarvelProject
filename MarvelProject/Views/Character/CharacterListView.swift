//
//  CharacterListView.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import SwiftUI

struct CharacterListView: View {
    let apiMediator: APIMediator
    
    var characterList: [Hero]
    var minimumValue: Int
    
    var showLoading: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Layer
                //  -- hidden when foreground layer is populated --
                if (showLoading) {
                    LoadingView()
                }
                // Foreground Layer
                else {
                    ScrollView() {
                        LazyVStack(spacing: 0) {
                            ForEach(characterList, id: \.self) { hero in
                                NavigationLink(destination: CharacterInspectView(viewModel: HeroViewModel(hero: hero))) {
                                    CharacterView(viewModel: HeroViewModel(hero: hero))
                                }
                            }
                        }
                        .padding(.vertical)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Preview Broken")
        //CharacterListView()
    }
}
