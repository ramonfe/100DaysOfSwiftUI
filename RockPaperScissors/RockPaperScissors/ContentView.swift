//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ramon Felix on 01/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var round = ["✊","🖐","✌️"]
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var tries = 0
    let toWin = ["rock","paper","scissor"]
    let toLose = ["paper","scissor","rock"]
    @State private var showScore = false
    
    var body: some View {
        VStack{
            Spacer()
            Text("Computer Choose").font(.title)
            Text(round[computerChoice])
                .font(.system(size: 200))
            //Spacer()
            //play for mwin or lose
            Text("You need to play to \(shouldWin ? "Win" : "Lose")")
            //butons
            HStack{
                ForEach(0..<3){c in
                    Button(round[c]){
                        play(choice: c)
                    }
                    .font(.system(size: 80))
                }
            }
            Spacer()
            Text("Score: \(score)").font(.subheadline)
            Spacer()
        }
        .alert("Game Over", isPresented: $showScore) {
            Button("Play Again", action: resetGame)
        }message: {
            Text("Your scores was \(score)")
        }
    }
    func play(choice:Int) {
        let winningMoves = [1,2,0]
        let didWin:Bool
        
        if shouldWin{
            didWin = choice == winningMoves[computerChoice]
        }else{
            didWin = winningMoves[choice] == computerChoice
        }
        if didWin{
            score+=1
        }
        else{
            if (score>0)
            {
                score-=1
            }
        }
        if (tries>=10){
            showScore=true
        }
        else{
            tries+=1
            computerChoice = Int.random(in: 0..<3)
            shouldWin.toggle()
        }
    }
    func resetGame(){
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        score=0
        tries=0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
