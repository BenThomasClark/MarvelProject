//
//  NoSearchResultsView.swift
//  MarvelProject
//
//  Created by Ben Clark on 09/08/2023.
//

import SwiftUI

struct NoSearchResultsView: View {
    let query: String
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.circle.fill")
                .font(.title)
            Text("No results found for:")
                .padding(10)
                .opacity(0.8)
            Text("\(query)")
                .opacity(0.8)
                .bold()
        }
        .padding()
        .background {
            Rectangle()
                .fill(.white)
                .cornerRadius(8)
                .shadow(radius: 10)
        }
    }
}

struct NoSearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        let query = "Spidor"
        NoSearchResultsView(query: query)
    }
}
