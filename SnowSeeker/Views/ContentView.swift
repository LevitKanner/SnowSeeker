//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Levit Kanner on 28/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var resorts: [Resort] = Bundle.main.decode("resorts.json")
    @ObservedObject var favorites = Favorites()
    @State private var isSorting = false
    @State private var isFiltering = false
    
    
    var body: some View {
        NavigationView{
            List(resorts){ resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.id)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40 , height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black , lineWidth: 0.5))
                    
                    VStack(alignment: .leading){
                        Text(resort.name)
                            .font(.custom("AvenirNext", size: 20))
                        
                        Text("\(resort.runs)")
                            .font(.custom("Avenir" , size: 10))
                    }
                    .layoutPriority(1)
                    
                    if self.favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .accessibility(label: Text("This is a favorite resort"))
                            .foregroundColor(Color.red)
                    }
                }
                .actionSheet(isPresented: self.$isSorting, content: { () -> ActionSheet in
                    ActionSheet(title: Text("sort"), message: Text("Select order of sort"), buttons: [
                        .default(Text("Alphabetic"), action: {
                            self.resorts.sort()
                        }),
                        .default(Text("Country"), action: {
                            self.resorts.sort { (lhs, rhs) -> Bool in
                                lhs.country < rhs.country
                            }
                        }),
                        .default(Text("Default"), action: {
                            self.resorts = Bundle.main.decode("resorts.json")
                        }),
                        .cancel()
                    ])
                })
            }
            
            .navigationBarTitle("Resorts")
            .navigationBarItems(leading: Button("Sort"){
                self.isSorting = true
                }, trailing: Button("Filter"){
                    self.isFiltering = true
            })
            WelcomeView()
        }
        .environmentObject(favorites)
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
