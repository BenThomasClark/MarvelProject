//
//  CharacterCarouselElementView.swift
//  MarvelProject
//
//  Created by Ben Clark on 09/08/2023.
//

import SwiftUI

struct CharacterCarouselElementView: View {
    //let viewModel: HeroViewModel
    var body: some View {
        
        VStack {
            //AsyncImageView(urlString: viewModel.getHeaderImagePath(), width: <#T##CGFloat#>, height: <#T##CGFloat#>, cornerRadius: <#T##CGFloat#>)
            Rectangle()
                .frame(width: 175, height: 240)
                .cornerRadius(8)
            HStack {
                VStack(alignment: .leading) {
                    Text("Spider-Man")
                        .font(.title3)
                        .bold()
                    Text("Peter Parker")
                        .italic()
                }
                Spacer()
                Image(systemName: "star.fill")
                    .padding(.trailing)
            }
            HStack {
                CountChipView(imagePath: "book.circle.fill", count: 99)
                CountChipView(imagePath: "theatermasks.circle.fill", count: 99)
                CountChipView(imagePath: "star.circle.fill", count: 99)
            }
        }
        .padding()
        .background {
            Rectangle()
                .fill(.white)
                .cornerRadius(8)
                .shadow(radius: 7)
        }
        .frame(maxWidth: 195)
    }
}

struct CharacterCarouselElementView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                CharacterCarouselElementView()
                CharacterCarouselElementView()
                CharacterCarouselElementView()
                CharacterCarouselElementView()
                CharacterCarouselElementView()
            }
            .padding()
            .padding(.horizontal, 10)
        }
    }
}
