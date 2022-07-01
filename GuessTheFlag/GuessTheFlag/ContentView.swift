//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ramon Felix on 27/06/22.
//

import SwiftUI

//View Composition
struct FlagImage: View{
    var flag: String
    
    var body: some View{
        Image(flag)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
//View Modifier
struct LargeFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View{
    func largeBlueFont() -> some View{
        modifier(LargeFont())
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingReset = false
    @State private var scoreTitle=""
    @State private var score=0
    @State private var tries=0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red:0.1,green: 0.2,blue: 0.45), location: 0.3),
                .init(color: Color(red:0.76,green: 0.15,blue: 0.26), location: 0.3)
            ],center: .top, startRadius: 200, endRadius: 700 )
            .ignoresSafeArea()
            VStack{
                Spacer()
                
                Text("Guess the Flag").foregroundColor(.white)
                    .font(.largeTitle.bold())
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag of").foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                        } label: {
                            //using a viewComposition
                            FlagImage(flag: countries[number])
                        }
                    }
                }
                .frame(maxWidth:.infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                
                Text("Score \(score)")
                    .largeBlueFont()
//                    .foregroundColor(.white)
//                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        }
        .alert("Game Over", isPresented: $showingReset) {
            Button("Reset", action: resetGame)
            //Button("Cancel"){}
        } message: {
            Text("Your score is \(score)")
        }
    }
    func flagTapped(_ number: Int)
    {
        tries+=1
        if (number == correctAnswer){
            scoreTitle="Correct"
            score+=1
        }
        else{
            scoreTitle="Wrong! that´s the flag of \(countries[number])"
        }
        showingScore=true
        if (tries >= 8){
            showingReset=true
        }
    }
    func resetGame(){
        tries=0
        score=0
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer=Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
