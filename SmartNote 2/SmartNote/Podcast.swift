//
//  Podcast.swift
//  DesafioTableViewUFPBTarde
//
//  Created by Student on 14/10/22.
//  Copyright © 2022 Student. All rights reserved.
//

import Foundation

class Podcast {
    let nomePodcast: String
    let episodiosPodcast: Int
    let fotoPodcast: String
    
    init (nomePodcast: String, episodiosPodcast: Int, fotoPodcast: String) {
        self.nomePodcast = nomePodcast
        self.episodiosPodcast = episodiosPodcast
        self.fotoPodcast = fotoPodcast
    }
}

class PodcastDAO {
    static func getList() -> [Podcast] {
        return [
            Podcast(nomePodcast: "FlowPodcast", episodiosPodcast: 123, fotoPodcast: "flow"),
            Podcast(nomePodcast: "NerdCast", episodiosPodcast: 850, fotoPodcast: "nerd"),
            Podcast(nomePodcast: "Podpah", episodiosPodcast: 519, fotoPodcast: "pod")
        ]
    }
}
