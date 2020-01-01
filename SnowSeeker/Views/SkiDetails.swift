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
        Group{
            Text("Elevation: \(resort.elevation)m").layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Snow: \(resort.snowDepth)cm").layoutPriority(1)
        }
    }
}

struct SkiDetails_Previews: PreviewProvider {
    static let resort = Resort.example
    static var previews: some View {
        SkiDetails(resort: resort)
    }
}
