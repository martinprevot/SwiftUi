//
//  ContentView.swift
//  tp2
//
//  Created by goldorak on 12/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack
                {
                Text("Galerie d'art ")
                NavigationLink(destination:
                VStack {
                    Image("chambre")
                    Text ("Voici une chambre")
                }
                )
                {
                    Text("chambre")
                }
                
                NavigationLink(destination:
                VStack {

                    Image("peinture")
                    Text("voici une peinture")
                }
                )
                {
                    Text("peinture")
                }
                NavigationLink(destination:
                VStack {
                    Image("nuit")
                    Text("voici une nuit")
                }
                )
                {
                    Text("nuit")
                }
                }.frame(width: 500, height: 500, alignment: .top)
        }.navigationTitle("Retour")
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
