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
//Custom Modifiers
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
    @State private var rotationDegree = 0.0
    @State private var buttonTapped = false
    @State private var btnTapNum = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    var body: some View {
        ZStack
        {
            RadialGradient(stops: [
                .init(color: Color(red:0.1,green: 0.2,blue: 0.45), location: 0.3),
                .init(color: Color(red:0.76,green: 0.15,blue: 0.26), location: 0.3)
            ],center: .top, startRadius: 200, endRadius: 700 )
            .ignoresSafeArea()
            VStack
            {
                Spacer()
                
                Text("Guess the Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                            //rotationDegree += 360
                        } label: {
                            //using a viewComposition
                            FlagImage(flag: countries[number])
                                .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                        }
//                        .rotation3DEffect(.degrees(rotationDegree), axis: (x:0,y:1,z:0))
//                        .animation(.default,value: number == btnTapNum ? true : false)
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
                    .foregroundColor(.white)
                    .font(.title.bold())
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
        btnTapNum = number
        
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
