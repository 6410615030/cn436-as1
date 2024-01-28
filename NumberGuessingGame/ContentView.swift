//
//  ContentView.swift
//  NumberGuessingGame
//
//  Created by Babypowder on 24/1/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guessNum: Double = 0.0
    @State var showResult = false
    var body: some View {
        VStack {
            Text("GUESS THE NUMBER")
            
                Text(String(Game.value(num: guessNum)))
                HStack {
                    Text("0")
                    Slider(value: $guessNum)
                    Text("100")
                }
                
            Button("Check") {
                showResult = true
                game.check(guess: guessNum)
            }

            .alert(isPresented: $showResult) {
                Alert(
                    title: Text("Result"),
                    message: Text(String(game.msg)),
                    dismissButton: .default(Text("OK")) {
                        if game.status {
                            guessNum = 0.0
                            game.startNewGame()
                        }

                    }
                    
                )
            
            
            }.padding()
            Text("You have tried \(game.n) times")

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
