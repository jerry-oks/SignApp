//
//  DataStore.swift
//  SignApp
//
//  Created by HOLY NADRUGANTIX on 03.09.2023.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    let images = [
        "figure.stand",
        "figure.walk",
        "figure.wave",
        "sun.max.fill",
        "heart.fill",
        "figure.roll"
    ]
    
    let colors = [
        "red",
        "yellow",
        "orange",
        "green",
        "blue",
        "purple"
    ]
    
    private init() {}
}

