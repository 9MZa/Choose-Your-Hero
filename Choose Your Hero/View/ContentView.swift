//
//  ContentView.swift
//  Choose Your Hero
//
//  Created by Bandit Silachai on 1/12/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var vm = HeroesViewModel()
    @State var searchText = ""
    var body: some View {
        NavigationView(content: {
            ScrollView {
                ForEach(searchResults, id: \.id) { hero in
                    NavigationLink(destination: Detail(hero: hero)) {
                        RowView(hero: hero)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Choose Your Hero")
            .searchable(text: $searchText)
        })
    }
    
    var searchResults: [Hero] {
        if searchText.isEmpty {
            return vm.heroes
        } else {
            return vm.heroes.filter { hero in
                hero.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview {
    ContentView()
}

struct RowView: View {
    let hero: Hero
    var body: some View {
        LazyHStack(alignment: .center, spacing: 10, content: {
            AsyncImage(url: URL(string: hero.smallThumbnail)) { phase in
                switch phase {
                case .empty:
                    ProgressView().progressViewStyle(.circular)
                        .foregroundStyle(.ultraThinMaterial)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 50, height: 50)
            Text(hero.name)
                .foregroundStyle(.white)
        })
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(8)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous), style: FillStyle())
    }
}
