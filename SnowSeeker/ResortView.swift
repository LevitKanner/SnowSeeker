//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Levit Kanner on 29/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ResortView: View {
    var resort: Resort
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading , spacing: 20){
                GeometryReader{ geometry in
                    Group{
                        if geometry.frame(in: .global).minY <= 0{
                            Image(decorative:self.resort.id)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width , height: geometry.size.height)
                                .offset(y: geometry.frame(in: .global).minY/9)
                                .clipped()
                        }else {
                            Image(self.resort.id)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width , height: geometry.size.height + geometry.frame(in: .global).minY)
                                .clipped()
                                .offset(y: -geometry.frame(in: .global).minY)
                        }
                    }
                }
                .frame(height: 400)
                
                HStack{
                    Spacer()
                    SkiDetails(resort: resort)
                    ResortDetails(resort: resort)
                    Spacer()
                }
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.top)
                
                
                Group{
                    Text(resort.description)
                        .padding()
                    
                    Text("Facilities")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Text(ListFormatter.localizedString(byJoining: resort.facilities))
                        .padding(.horizontal)
                        
                }
                .padding(.horizontal)
                
                
            }
        }
        .navigationBarTitle("\(resort.name) , \(resort.country)" , displayMode: .inline)
    }
}

struct ResortView_Previews: PreviewProvider {
    static let resort = (Bundle.main.decode("resorts.json")  as [Resort])[0]
    static var previews: some View {
        ResortView(resort: self.resort)
    }
}
