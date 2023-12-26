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
        VStack(alignment:.center, content: {
            ZStack(content: {
                AsyncImage(url: URL(string: hero.bigThumbnail)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView().progressViewStyle(.circular)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    case .failure(let error):
                        Text(error.localizedDescription)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 200, height: 200)

            })
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            
            VStack(alignment: .leading ,content: {
                HStack(alignment: .center, content: {
                    Text(hero.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    AsyncImage(url: URL(string: hero.primaryStat.icon)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView().progressViewStyle(.circular)
                                .foregroundStyle(.ultraThinMaterial)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        case .failure(let error):
                            Text(error.localizedDescription)
                        @unknown default:
                            EmptyView()
                        }
                    }

                })
                
                Text(hero.heroOneLiner)
                    .font(.headline)
                    .fontWeight(.light)
            })
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding()
            Spacer()
        })
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}
