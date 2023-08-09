//
//  CharacterView.swift
//  MarvelProject
//
//  Created by Ben Clark on 02/08/2023.
//

import SwiftUI

struct CharacterView: View {
    let viewModel: HeroViewModel
    
    var body: some View {
        HStack {
            AsyncImageView(urlString: viewModel.getImagePath(), width: 100, height: 100, cornerRadius: 8)
                .background {
                    Rectangle()
                        .fill(.gray)
                        .opacity(0.3)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                }
                .frame(width: 100, height: 100)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "star")
                                .foregroundColor(.white)
                                .padding(5)
                        }
                    }
                }
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.getCleanName())
                    .font(.title2).bold()
                    .multilineTextAlignment(.leading)
                if (viewModel.getSubtitle() != nil) {
                    Text(viewModel.getSubtitle() ?? "")
                        .italic()
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                }
                HStack {
                    // Comics
                    CountChipView(imagePath: "book.circle.fill", count: viewModel.hero.comics?.available ?? 0)
                    // Stories
                    CountChipView(imagePath: "theatermasks.circle.fill", count:  viewModel.hero.stories?.available ?? 0)
                    // Events
                    CountChipView(imagePath: "star.circle.fill", count:  viewModel.hero.events?.available ?? 0)
                }
            }
            .foregroundColor(.black)
            .padding(10)
            Spacer()
            Image(systemName: "chevron.forward.circle")
                .foregroundColor(.black)
                .padding(.trailing, 10)
        }
        .padding(.horizontal, 10)
        .background {
            Rectangle()
                .fill(.white)
                .cornerRadius(8)
        }
        .padding(10)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        
        Text("Preview Broken")
//        let unavailableThumbnailHero = Hero(id: 0, name: "Hero Name (subtitle)", description: "", resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil)
//
//        let abomination = Hero(id: 0, name: "Abomination (Emil Blonsky)", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04", thumbnailExtension: .jpg), resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil)
//
//        let unavailableThumbnailHeroViewModel = HeroViewModel(Hero: unavailableThumbnailHero)
//
//        let abominationHeroViewModel = HeroViewModel(Hero: abomination)
//
//        ZStack {
//            Rectangle()
//                .fill(.gray)
//                .opacity(0.3)
//                .ignoresSafeArea()
//            VStack {
//                CharacterView(viewModel: unavailableThumbnailHeroViewModel)
//                CharacterView(viewModel: abominationHeroViewModel)
//
//            }
//
//        }
    }
}
