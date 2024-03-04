//
//  Quote.swift
//  EverydayQuote
//
//  Created by Maryna Bolotska on 03/03/24.
//

import Foundation

struct AllQuotes: Codable, Hashable {
    let allQuotes: [Quote] 
}

struct Quote: Codable, Hashable {
    let quote: String
    let author: String
    let category: String?
}

struct Categories {
    let categories = [
        "age", "alone", "amazing", "anger", "architecture", "art", "attitude",
        "beauty", "best", "birthday", "business", "car", "change", "communication",
        "computers", "cool", "courage", "dad", "dating", "death", "design", "dreams",
        "education", "environmental", "equality", "experience", "failure", "faith",
        "family", "famous", "fear", "fitness", "food", "forgiveness", "freedom",
        "friendship", "funny", "future", "god", "good", "government", "graduation",
        "great", "happiness", "health", "history", "home", "hope", "humor",
        "imagination", "inspirational", "intelligence", "jealousy", "knowledge",
        "leadership", "learning", "legal", "life", "love", "marriage", "medical",
        "men", "mom", "money", "morning", "movies", "success"
    ]
}
