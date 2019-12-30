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
    @Environment(\.horizontalSizeClass) var sizeClass
    @State var selectedFacility: Facility?
    
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
                    if sizeClass == .compact {
                        Spacer()
                        VStack{ResortDetails(resort: resort)}
                        VStack{SkiDetails(resort: resort)}
                        Spacer()
                    }else{
                        ResortDetails(resort: resort)
                        Spacer().frame(height: 2)
                        SkiDetails(resort: resort)
                    }
                }
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                
                
                Group{
                    Text(resort.description)
                        .padding()
                    
                    Text("Facilities")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    HStack{
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFacility = facility
                            }
                        }
                    }
                    .padding(.vertical)
                    
                }
                .padding(.horizontal)
            }
        }
        .alert(item: $selectedFacility, content: { (facility) -> Alert in
            facility.alert
        })
        .navigationBarTitle("\(resort.name) , \(resort.country)" , displayMode: .inline)
    }
}

struct ResortView_Previews: PreviewProvider {
    static let resort = (Bundle.main.decode("resorts.json")  as [Resort])[0]
    static var previews: some View {
        ResortView(resort: self.resort)
    }
}
