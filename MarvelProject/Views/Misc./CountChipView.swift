//
//  CountChipView.swift
//  MarvelProject
//
//  Created by Ben Clark on 08/08/2023.
//

import SwiftUI


struct CountChipView: View {
    let imagePath: String
    let count: Int
    var body: some View {
        HStack {
            Image(systemName: "\(imagePath)")
            Text("\(count)")
        }
        .padding(4)
        .background {
            Rectangle()
                .fill(.gray)
                .opacity(0.3)
                .cornerRadius(8)
        }
        .font(.caption2)
    }
}

struct CountChipView_Previews: PreviewProvider {
    static var previews: some View {
        
        HStack {
            CountChipView(imagePath: "book.circle.fill", count: 99)
            CountChipView(imagePath: "theatermasks.circle.fill", count: 99)
            CountChipView(imagePath: "star.circle.fill", count: 99)
        }
    }
}
