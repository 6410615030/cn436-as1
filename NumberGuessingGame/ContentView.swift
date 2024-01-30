//
//  ContentView.swift
//  NumberGuessingGame
//
//  Created by Babypowder on 24/1/2567 BE.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var game = Game()
    @State var guessNum: Double = 0.0
    @State var showResult = false
    @State var showRestart = false
    
    var body: some View {
        
        VStack {
          Spacer()
          ZStack {
            Spacer()
              
              VStack {
                  Text("GUESS THE NUMBER")
                      .font(.title)
                      .fontWeight(.bold)
                      .foregroundColor(.white)
                      .shadow(color: .black, radius: 5, x: 0, y: 5)
                  
                  
                  
                  Text("???")
                      .font(.largeTitle)
                      .fontWeight(.bold)
                      .foregroundColor(.orange)
                      
                  
                  
                  
                      Text(String(Game.value(num: guessNum)))
                      .font(.largeTitle)
                      .fontWeight(.bold)
                      
                      
                      HStack {
                          ColorSlider(value: $guessNum, trackColor: .black)
                              .foregroundColor(.black)
                              .padding()
                              .background(
                                  RoundedRectangle(cornerRadius: 20)
                                      .foregroundColor(.white)
                              )

                      }
                  Text("You have tried \(game.n) times")
                      
                  Button("Check") {
                      showResult = true
                      game.check(guess: guessNum)
                  }.foregroundColor(.white)
                      .padding()
                      .background(
                          RoundedRectangle(cornerRadius: 20)
                              .foregroundColor(.black)
                      )

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
                  
                  //Press to restart the game
                  Button("Restart") {
                      showRestart = true
                      game.status = true
                      
                  }.foregroundColor(.white)
                      .padding()
                      .background(
                          RoundedRectangle(cornerRadius: 20)
                              .foregroundColor(.red)
                      )

                      .alert(isPresented: $showRestart) {
                          Alert(
                              title: Text("Are you sure you want to restart?"),
                              primaryButton: .default(Text("Yes")) {
                                  if game.status {
                                      guessNum = 0.0
                                      game.startNewGame()
                                  }
                              },
                              secondaryButton: .cancel(Text("No"))
                          )
                      }
                      .padding()
  
              }.padding()
              
            Spacer()
          }
          Spacer()
        }.background(Color.cyan.edgesIgnoringSafeArea(.all))
    }
}
struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("100")
        }
    }
}

#Preview {
    ContentView()
}
