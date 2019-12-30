//
//  Resort.swift
//  SnowSeeker
//
//  Created by Levit Kanner on 29/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

struct Resort: Identifiable , Codable{
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
    
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    var size: Int
    var facilityTypes: [Facility]{
        facilities.map(Facility.init)
    }
    
}
