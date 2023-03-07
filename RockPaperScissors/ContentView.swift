//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jan Sulejmani on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @State public var computerPick = "🪨"
    @State public var options = ["🪨", "🧻", "✂️"]
    @State public var winOrLoss = ["WIN", "LOSS"]
    @State public var computerPickWinOrLoss = "WIN"
    @State public var score = 0
    @State public var round = 0
    @State public var userPick = ""
    @State public var showAlert = false
    
    var body: some View {
        VStack(spacing: 25){
            Spacer()
            Text("Score: \(score)")
                .bold()
                .font(.system(size: 32))
            Spacer()
            Text(computerPick)
                .bold()
                .font(.system(size: 200))
            Text("You should pick the choice that will give you a ")
            Text("\(computerPickWinOrLoss)")
                .foregroundColor(computerPickWinOrLoss == "WIN" ? .green: .red)
                .bold()
            HStack(spacing: 20){
                Button(action: {
                    userPick = "🪨"
                    newRound()
                }, label: {
                    Text("🪨")
                })
                    .padding(25)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                Button(action: {
                    userPick = "🧻"
                    newRound()
                }, label: {
                    Text("🧻")
                })
                    .padding(25)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                Button(action: {
                    userPick = "✂️"
                    newRound()
                }, label: {
                    Text("✂️")
                })
                    .padding(25)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
            }
            Spacer()
            Spacer()
        }
        .alert(isPresented: $showAlert){
            Alert(title: Text("Round Completed"),
        message: Text("Your achieved score in this round was \(score)/10"),
        dismissButton: Alert.Button.default(Text("New Round"), action: {score = 0}))
        }
    }
    
    func newRound(){
        scoreOrLoss()
        computerPick = options.randomElement() ?? "🪨"
        computerPickWinOrLoss = winOrLoss.randomElement() ?? "WIN"
        round += 1
        if round == 10{
            round = 0
            showAlert = true
        }
            
    }
    
    func scoreOrLoss(){
        if round == 0{
            score = 0
        }
        if computerPickWinOrLoss == "WIN"{
            if userPick == "🪨" && computerPick == "✂️"{
                score += 1
            }
            else if userPick == "🧻" && computerPick == "🪨"{
                score += 1
            }
            else if userPick == "✂️" && computerPick == "🧻"{
                score += 1
            }
            else{
                score -= 1
            }
        }else{
            if userPick == "🪨" && computerPick == "🧻"{
                score += 1
            }
            else if userPick == "🧻" && computerPick == "✂️"{
                score += 1
            }
            else if userPick == "✂️" && computerPick == "🪨"{
                score += 1
            }
            else{
                score -= 1
            }
        }
                
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
