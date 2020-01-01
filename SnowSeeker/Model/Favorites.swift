//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Levit Kanner on 31/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published private var resorts: Set<String>
    
    private let saveKey = "Favorites"
    
    init(){
        //Load favorites from userdefaults
        if let data = UserDefaults.standard.data(forKey: saveKey){
            if let decodedData = try? JSONDecoder().decode(Set<String>.self, from: data){
                self.resorts = decodedData
                return
            }
            
        }
        self.resorts = []
    }
    
    var count: Int {
        resorts.count
    }
    
    func contains(_ resort: Resort) -> Bool{
        resorts.contains(resort.id)
    }
    
    
    func add(_ resort: Resort){
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort){
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save(){
        if let encodedData = try? JSONEncoder().encode(resorts){
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}
