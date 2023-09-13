import SwiftUI

struct ContentView: View {
    // Définition des états du jeu
    @State private var grille: [[Joueur?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3) // Grille du jeu
    @State private var joueurActuel: Joueur = .x // Joueur actuel
    @State private var gagnant: Joueur? // Joueur gagnant
    @State private var estMatchNul = false // Indicateur de match nul
  
    

    var body: some View {
        

        ZStack{
            Color.accentColor

        VStack {
            
            Image("Image")
                .font(.largeTitle)
                .frame(width: 20, height: 150 )
                .padding()
            
            if gagnant == nil {
                let tour : String = "Au tour de \(joueurActuel.rawValue)"
                Text(tour)
            }
            else{
                let tour : String = "🎉 Match fini 🎉"
                Text(tour)
            }
            
            // Création de la grille du jeu avec LazyVGrid
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                ForEach(0..<3, id: \.self) { ligne in
                    ForEach(0..<3, id: \.self) { colonne in
                        Button(action: {
                            if grille[ligne][colonne] == nil && gagnant == nil {
                                grille[ligne][colonne] = joueurActuel
                                verifierGagnant(ligne: ligne, colonne: colonne)
                                changerJoueur()
                               
                                

                            }
                            
                        }) {
                            Text(grille[ligne][colonne]?.symbole ?? "")
                                .font(.largeTitle)
                                .frame(width: 115, height: 115)
                                .background(Color.white.opacity(0.3))
                            
                        }
                        .disabled(grille[ligne][colonne] != nil || gagnant != nil)
                    }

                }
                
            }
            .padding()

            // Affichage du résultat de la partie
            if let _ = gagnant {
                Text("\(gagnant!.symbole) a gagné !")
                    .font(.headline)
            } else if estMatchNul {
                Text("Match nul !").font(.headline)
                }
            //bouton rejouer
            Button(action:  {
                recommencerPartie()
            }){
                Text("Rejouer")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
            }
            
            }
        }

 
    }
    // Fonction pour changer de joueur à chaque tour
    func changerJoueur() {
        joueurActuel = (joueurActuel == .x) ? .o : .x
    }

    // Fonction pour vérifier s'il y a un gagnant
    func verifierGagnant(ligne: Int, colonne: Int) {
        // Vérification des lignes, colonnes et diagonales
        let joueur = joueurActuel

        for i in 0..<3 {
            if grille[i][colonne] != joueur { break }
            if i == 2 {
                gagnant = joueur
                return
            }
        }

        for i in 0..<3 {
            if grille[ligne][i] != joueur { break }
            if i == 2 {
                gagnant = joueur
                return
            }
        }

        if ligne == colonne {
            for i in 0..<3 {
                if grille[i][i] != joueur { break }
                if i == 2 {
                    gagnant = joueur
                    return
                }
            }
        }

        if ligne + colonne == 2 {
            for i in 0..<3 {
                if grille[i][2-i] != joueur { break }
                if i == 2 {
                    gagnant = joueur
                    return
                }
            }
        }

        if !grille.flatMap({ $0 }).contains(nil) {
            estMatchNul = true
        }
    }
    func recommencerPartie(){
        grille = Array(repeating: Array(repeating: nil, count: 3), count: 3)
        gagnant = nil
        estMatchNul = false
        joueurActuel = .x
    }
}



// Énumération pour représenter les joueurs (X et O)
enum Joueur: String {
    case x = "❌"
    case o = "⭕"

    var symbole: String {
        return self.rawValue
    }
}
