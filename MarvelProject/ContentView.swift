//
//  ContentView.swift
//  MarvelProject
//
//  Created by Ben Clark on 02/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var apiMediator = MarvelProject.APIMediator()
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                
                // -- List
                CharacterListView(apiMediator: apiMediator, characterList: apiMediator.Heros, minimumValue: 0)
                .onAppear {apiMediator.listFetch()}
                .tabItem {
                    TabItemView(imagePath: "list.bullet.circle", text: "list")
                }
                
                // -- HOME
                CharacterListView(apiMediator: apiMediator, characterList: apiMediator.FeaturedHeros, minimumValue: apiMediator.featuredIds.count)
                .onAppear {
                    if (apiMediator.FeaturedHeros.count != apiMediator.featuredIds.count) {
                        apiMediator.getFeaturedList()
                    }
                }
                .tabItem {
                    TabItemView(imagePath: "house.and.flag.circle.fill", text: "home")
                }
                
                // -- SEARCH
                SearchView(apiMediator: apiMediator)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Search")
                    }
                }
                
                // -- FAVOURITES
                VStack {
                    Text("Favourites View")
                        .padding()
                    Image(systemName: "star.circle.fill")
                }
                .tabItem {
                    VStack {
                        Image(systemName: "star.circle")
                        Text("Favourites")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
