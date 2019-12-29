//
//  SkiDetails.swift
//  SnowSeeker
//
//  Created by Levit Kanner on 29/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct SkiDetails: View {
    var resort: Resort
    
    var body: some View {
        VStack{
            Text("Elevation: \(resort.elevation)m")
            Text("Snow: \(resort.snowDepth)cm")
        }
    }
}

struct SkiDetails_Previews: PreviewProvider {
    static let resort = Resort.example
    static var previews: some View {
        SkiDetails(resort: resort)
    }
}
