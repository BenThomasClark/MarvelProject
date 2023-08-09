//
//  ComicInspectView.swift
//  MarvelProject
//
//  Created by Ben Clark on 05/08/2023.
//

import SwiftUI

struct ComicInspectView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(.gray)
                .cornerRadius(8)
                .frame(width: 230, height: 320)
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "star")
                        .foregroundColor(.white)
                        .padding(20)
                        .font(.title3)
                }
            VStack {
                Text("Gun Theory (2003) #4")
                    .bold()
            }
        }
        .padding()
        .background {
            Rectangle()
                .fill(.white)
                .cornerRadius(8)
        }
        .padding()
    }
}

struct ComicInspectView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ComicInspectView()
        }
        .ignoresSafeArea()
        .background {
            Rectangle()
                .fill(.black)
        }
    }
}
