//
//  DataStore.swift
//  SignApp
//
//  Created by Aleksey Vinogradov on 02.09.2023.
//

final class DataStore {
    
    static let shared = DataStore()
    var user = User()
    
    private init() {}
}
