//
//  LoadingView.swift
//  MarvelProject
//
//  Created by Ben Clark on 09/08/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
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

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LoadingView()
        }
    }
}
