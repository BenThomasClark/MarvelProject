//
//  CharacterInspectView.swift
//  MarvelProject
//
//  Created by Ben Clark on 03/08/2023.
//

import SwiftUI

struct CharacterInspectView: View {
    
    let viewModel: HeroViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var bttn: some View { Button(action: { self.presentationMode.wrappedValue.dismiss()}) {
        Image(systemName: "chevron.backward.circle.fill")
            .foregroundColor(.white)
            .background {
                Circle()
                    .fill(.black)
            }
        }
    }
    
    var body: some View {
        GeometryReader { gr in
            ZStack {
                VStack {
                    AsyncImageView(urlString: viewModel.getHeaderImagePath(), width: gr.size.width, height: gr.size.height/1.75, cornerRadius: 0)
                        .overlay {
                            VStack {
                                Spacer()
                                LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
                                    .frame(height: 30)
                            }
                        }
                    Spacer()
                }
                .background {
                    Rectangle()
                        .fill(.white)
                }
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 75)
                            .padding(.top, -75)
                        // MARK: Header
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(viewModel.getCleanName())
                                        .font(.largeTitle).bold()
                                        .padding(.leading)
                                    let subtitle = viewModel.getSubtitle()
                                    if (subtitle != nil) {
                                        Text(viewModel.getSubtitle()!)
                                            .font(.title3).italic()
                                            .padding(.leading)
                                    }
                                }
                                Spacer()
                                Image(systemName: "star")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                    .padding(.trailing)
                            }
                            .padding(.vertical)
                            
                            // MARK: Description
                            VStack {
                                if (viewModel.getDescription() != nil) {
                                    Text(viewModel.getDescription()!)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                            
                            // MARK: Links
                            HStack {
                                ForEach(viewModel.hero.urls ?? [], id: \.self) { link in
                                    Link(destination: URL(string: link.url ?? "")!) {
                                        LinkIconView(systemName: link.getTypeImagePath(), text: link.getTypeString())
                                    }
                                }
                            }
                            .padding(.leading)
                            .padding(.bottom)
                            
                        }
                        VStack(alignment: .leading, spacing: 20) {
                            ListOfStrings(title: "Comics",
                                          elements: viewModel.hero.comics?.getItemsName() ?? [],
                                          available: viewModel.hero.comics?.available ?? 0,
                                          imageName: "book.circle.fill")
                            Divider()
                            ListOfStrings(title: "Stories",
                                          elements: viewModel.hero.stories?.getItemsName() ?? [],
                                          available: viewModel.hero.comics?.available ?? 0,
                                          imageName: "theatermasks.circle.fill")
                            Divider()
                            ListOfStrings(title: "Events",
                                          elements: viewModel.hero.events?.getItemsName() ?? [],
                                          available: 0,
                                          imageName: "star.circle.fill")
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 150)
                    }
                    .background(.white)
                    .padding(.top, gr.size.height/1.75)
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: bttn)
            .ignoresSafeArea()
        }
    }
}
    
struct ListOfStrings: View {
    let title: String
    let elements: [String]
    let available: Int
    let imageName: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title):")
                .font(.title3)
            Text("Count: \(available)")
                .font(.caption2)
            ForEach(elements, id: \.self) { element in
                HStack {
                    Image(systemName: imageName)
                        .background {
                            Circle().fill(.black)
                        }
                        .foregroundColor(.white)
                    Text(element.capitalized)
                        .font(.caption2)
                        .bold()
                }
                .padding(.leading)
                .padding(.top, 3)
            }
        }
    }
}
    
//
//struct CharacterInspectView_Previews: PreviewProvider {
//    static var previews: some View {
//        let hero = Hero(id: 0, name: "Hero Name (subtitle)", description: "", resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil)
//                
//        CharacterInspectView(hero: hero)
//    }
//}
