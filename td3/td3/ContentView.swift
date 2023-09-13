//
//  ContentView.swift
//  td3
//
//  Created by goldorak on 12/09/2023.
//

import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
    let text: String
    let isSubscribed : Bool = false

}

struct ContentView: View {

    @State private var tache: String = ""
    @State private var liste:[Todo] = []
    @State private var isOn = false
    @State private var element: Int
    


    var body: some View {
        VStack{
        TextField(
               "Nom de la tache",
               text: $tache
           )
            
           
           .textInputAutocapitalization(.never)
           .disableAutocorrection(true)
           .border(.secondary)
        
            Button(
              "Ajouter la tache",
              action: {
                  liste.append(Todo(text: tache))
                  
                  
              })
            
            
            ForEach(liste) { element in
                HStack{
                    Toggle("",isOn: element.isSubscribed)
                    Text(element.text)
                    Spacer()
                    Text("Supprimer")
                    
                }
            }.onDelete { indexSet in
                liste.remove(atOffsets: indexSet)
               }
        }
        
        }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    }
}
