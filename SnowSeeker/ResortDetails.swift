//
//  ResortDetails.swift
//  SnowSeeker
//
//  Created by Levit Kanner on 29/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ResortDetails: View {
    var resort: Resort
    var size: String{
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    }
    var price: String{
        String.init(repeating: "$", count: resort.price)
    }
    var body: some View {
        VStack{
            Text("Size: \(size)")
            Text("Price: \(price)")
        }
    }
}

struct ResortDetails_Previews: PreviewProvider {
    static let resort = Resort.example
    static var previews: some View {
        ResortDetails(resort: resort)
    }
}
