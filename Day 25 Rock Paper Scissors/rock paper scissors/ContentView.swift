//
//  ContentView.swift
//  rock paper scissors
//
//  Created by Logan Marek on 3/22/21.
//Need to add an alert that resets the game and shows the score


import SwiftUI

extension View {
    func trueFaleMod(_ bool: Bool) -> some View {
        if bool == true {
            return Text("Select the choice that results in a win")
        } else {
            return Text ("Select the choice that results in a loss")
        }
    }
}

struct ContentView: View {
    //creates a variable containing all possible rock, paper, scissors choices a user can make
    @State private var choices = ["Rock", "Paper", "Scissors"]
    //whatever the app chooses as the rock, paper, scissors move
    @State private var appChoice = Int.random(in: 0...2)
    //whatever the user chooses as their rock, paper, scissors choice
    @State private var userChoice = 0
    //user's score
    @State private var userScore = 0
    //counter to expire the game at ten turns
    @State private var counter = 0
    
    //end of the game tracker which starts as false
    @State private var endOfGame = false
    
    var body: some View {
        VStack{
            var winOrLose = Bool.random()
            var appChoiceText = choices[appChoice]
            Text("Computer chooses \(choices[appChoice])")
            Text("")
                .trueFaleMod(winOrLose)
            //Text("\(userScore)")
            Text("Turns left \(10 - counter)")
            Spacer()
            Button(action: {
                if winOrLose == true && appChoiceText == choices[2]{
                    userScore += 1
                    winOrLose = Bool.random()
                    appChoice = Int.random(in: 0...2)
                    counter += 1
                } else if winOrLose == false && appChoiceText == choices[1] {
                    userScore += 1
                    winOrLose = Bool.random()
                    appChoice = Int.random(in: 0...2)
                    counter += 1
                } else {
                    userScore += 0
                    winOrLose = Bool.random()
                    appChoice = Int.random(in: 0...2)
                    counter += 1
                }
                self.endOfGameCheck()
            }, label: {
                VStack{
                    Text("Rock")
                        .font(.largeTitle)
                    Spacer()
                }
            })
            Button(action: {
                if winOrLose == true && appChoiceText == choices[0]{
                    userScore += 1
                    winOrLose = Bool.random()
                    appChoice = Int.random(in: 0...2)
                    counter += 1
                } else if winOrLose == false && appChoiceText == choices[2] {
                    userScore += 1
                    winOrLose = Bool.random()
                    appChoice = Int.random(in: 0...2)
                    counter += 1
                } else {
                    userScore += 0
                    winOrLose = Bool.random()
                    appChoice = Int.random(in: 0...2)
                    counter += 1
                }
                self.endOfGameCheck()
            }, label: {
                VStack{
                    Text("Paper")
                        .font(.largeTitle)
                    Spacer()
                }
            })
            Button(action: {
                if winOrLose == true && appChoiceText == choices[1]{
                    userScore += 1
                    winOrLose = Bool.random()
                    appChoice = Int.random(in: 0...2)
                    counter += 1
                } else if winOrLose == false && appChoiceText == choices[0] {
                    userScore += 1
                    winOrLose = Bool.random()
                    appChoice = Int.random(in: 0...2)
                    counter += 1
                } else {
                    userScore += 0
                    winOrLose = Bool.random()
                    appChoice = Int.random(in: 0...2)
                    counter += 1
                }
                self.endOfGameCheck()
            }, label: {
                VStack{
                    Text("Scissors")
                        .font(.largeTitle)
                    Spacer()
                }
            })
            .alert(isPresented: $endOfGame) {
                Alert(title: Text("End of game, your score was..."), message: Text("\(userScore)"), dismissButton: .default(Text("Start new game")){
                    self.resetVar()
                })
                    }
        }
    }
    //resets the game
    func resetVar() {
        counter = 0
        userScore = 0
    }
    //checks if game is over and then ends the game with the end of game alert call
    func endOfGameCheck() {
        if counter == 10 {
            endOfGame = true
        } else {
            endOfGame = false
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
