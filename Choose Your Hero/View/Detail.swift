//
//  Detail.swift
//  Choose Your Hero
//
//  Created by Bandit Silachai on 2/12/23.
//

import SwiftUI

struct Detail: View {
    
    let hero: Hero
    
    var body: some View {
        VStack(alignment:.leading, content: {
            ZStack(content: {
                AsyncImage(url: URL(string: hero.bigThumbnail)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    
                } placeholder: {
                    ProgressView().progressViewStyle(.circular)
                }
                .padding()
            })
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            
            VStack(alignment: .leading ,content: {
                
                HStack(alignment: .center, content: {
                    Text(hero.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    AsyncImage(url: URL(string: hero.primaryStat.icon)) { item in
                        item.image?
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                })
                
                Text(hero.heroOneLiner)
                    .font(.headline)
                    .fontWeight(.light)
            })
            .padding()
            
            Spacer()
        })
    }
}
