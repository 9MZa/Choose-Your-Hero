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
            List {
                ForEach(searchResults, id: \.id) { hero in
                    NavigationLink(destination: Detail(hero: hero)) {
                        RowView(hero: hero)
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
        HStack(alignment: .center, spacing: 10, content: {
            AsyncImage(url: URL(string: hero.smallThumbnail)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
            } placeholder: {
                ProgressView().progressViewStyle(.circular)
            }
            
            Text(hero.name)
        })
    }
}
