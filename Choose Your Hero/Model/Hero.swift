//
//  Hero.swift
//  Choose Your Hero
//
//  Created by Bandit Silachai on 2/12/23.
//

struct Hero: Codable {
    let id: Int
    let name: String
    let primaryStat: PrimaryStat
    let heroOneLiner: String
    let smallThumbnail, bigThumbnail: String
    let videoThumbnail: String
    let sourceLink: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case primaryStat = "primary_stat"
        case heroOneLiner = "hero_one_liner"
        case smallThumbnail = "small_thumbnail"
        case bigThumbnail = "big_thumbnail"
        case videoThumbnail = "video_thumbnail"
        case sourceLink = "source_link"
    }
}

struct PrimaryStat: Codable {
    let icon: String
    let name: String
}
