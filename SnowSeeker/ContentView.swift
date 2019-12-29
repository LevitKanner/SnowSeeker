//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Levit Kanner on 28/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
        NavigationView{
            List(resorts){ resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40 , height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black , lineWidth: 0.5))
                    
                    VStack(alignment: .leading){
                        Text(resort.name)
                            .font(.custom("AvenirNext", size: 20))
                        
                        Text("\(resort.runs)")
                            .font(.custom("Avenir" , size: 10))
                    }
                }
            }
            .navigationBarTitle("Resorts")
            WelcomeView()
        }
    .phoneOnlyStackNavigationView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View{
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        }else {
            return AnyView(self)
        }
    }
}
