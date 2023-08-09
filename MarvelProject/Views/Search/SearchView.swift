//
//  SearchView.swift
//  MarvelProject
//
//  Created by Ben Clark on 09/08/2023.
//

import SwiftUI

struct SearchView: View {
    
    let apiMediator: APIMediator
    @State var query: String = ""
    
    var body: some View {
        GeometryReader { gr in
            VStack {
                ScrollView(showsIndicators: false) {
                    if (apiMediator.noSearchResults) {
                        NoSearchResultsView(query: query)
                    }
                    if (apiMediator.SearchHeros.isEmpty) {
                        VStack(alignment:.center) {
                            HStack {
                                Spacer()
                                Image(systemName: "magnifyingglass")
                                Text("Search for a Marvel Character.")
                                    .bold()
                                    .padding(5)
                                Spacer()
                            }
                            Text("Tip: Search for the start of a characters' name")
                                .font(.callout)
                                .italic()
                                .opacity(0.5)
                        }
                        .padding()
                        .padding(.top, 300)
                    }
                    else {
                        CharacterListView(apiMediator: apiMediator, characterList: apiMediator.SearchHeros, minimumValue: 0, showLoading: false)
                            .border(.green)
                            .frame(height: gr.size.height - 20)
                            .ignoresSafeArea()
                    }
                }
                .padding(.top, 51)
                .overlay(alignment: .top) {
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search", text: $query, onEditingChanged: {_ in
                                apiMediator.searchFetch(query: query)
                            })
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    .background {
                        Rectangle().fill(.ultraThickMaterial)
                            .ignoresSafeArea()
                    }
                    .onAppear {
                        apiMediator.searchHeaderVisible = true
                    }
                }
                if (apiMediator.SearchHeros.count > 0) {
                    Text("\(apiMediator.SearchHeros.count) results for '\(query)'")
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let apiMediator = APIMediator()
        SearchView(apiMediator: apiMediator)
    }
}
