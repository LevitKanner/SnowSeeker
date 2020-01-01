//
//  Bundle-Extension.swift
//  SnowSeeker
//
//  Created by Levit Kanner on 29/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

extension Bundle{
    func decode<T: Codable> (_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle ")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to get data from url")
        }
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode Data")
        }
        
        return decodedData
        
    }
}
