//
//  JokeModel.swift
//  Jokes
//
//  Created by Fernando De Leon on 10/8/2022.
//

import Foundation

struct Jokes:Codable {
    var results: [Joke]?;
}

struct Joke: Identifiable, Codable {
    var id: String;
    var joke: String;
}
