//
//  AsyncImageView.swift
//  MarvelProject
//
//  Created by Ben Clark on 02/08/2023.
//

import SwiftUI

struct AsyncImageView: View {
    let urlString: String?
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    var body: some View {
        if (urlString != nil) {
            AsyncImage(
                url: URL(string: urlString!),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height)
                        .cornerRadius(cornerRadius)
                },
                placeholder: {
                    ProgressView()
                }
            )
        }
        else {
            ZStack {
                Rectangle()
                    .fill(.gray)
                    .opacity(0.3)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                Image(systemName: "photo.fill")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .cornerRadius(cornerRadius)
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        let urlString = "https://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04.jpg"
        ZStack {
            Rectangle()
                .fill(.black)
                .ignoresSafeArea()
            AsyncImageView(urlString: urlString, width: 200, height: 240, cornerRadius: 8)
        }
    }
}
