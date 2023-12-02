//
//  HeroViewModel.swift
//  Choose Your Hero
//
//  Created by Bandit Silachai on 2/12/23.
//

import Foundation

class HeroesViewModel: ObservableObject {
    @Published var heroes: [Hero] = []
    @Published var isLoading = false
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        isLoading = true
        guard let url = URL(string: "https://dota2-heroes-api.vercel.app/heroes") else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let result =  try decoder.decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    self.heroes = result
                    self.isLoading = false
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        session.resume()
    }
    
}
