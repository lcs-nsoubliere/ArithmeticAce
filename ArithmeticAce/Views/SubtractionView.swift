//
//  SubtractionView.swift
//  ArithmeticAce
//
//  Created by Noah Soubliere on 2022-02-07.
//

import SwiftUI

struct SubtractionView: View {
   
    // MARK: Stored properties
    @State var minuend = Int.random(in: 1...144)
    @State var subtrahend = 0
    @State var inputGiven = ""
   
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var correctDifference: Int {
        return minuend - subtrahend
    }
    var body: some View{
        VStack(spacing: 0) {
            HStack {
                Text("-")
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(minuend)")
                    Text("\(subtrahend)")
                }
            }
            Divider()
            HStack {
                ZStack{
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                 
                    // CONDITION true false
                        .opacity(answerCorrect ? 1.0 : 0.0)
                    Image(systemName: "x.circle")
                        .foregroundColor(.red)

                    // CONDITION1 condition2
                    // true false
                        .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
                }
                Spacer()
                TextField("",
                          text: $inputGiven)
                    .multilineTextAlignment(.trailing)
            }
            ZStack{
                Button(action: {
                
                    // Answer has been checked!
                    answerChecked = true
               
                    // Convert the input given to an integer, if possible
                    guard let differenceGiven = Int(inputGiven) else {
                        // Sadness, not a number
                        answerCorrect = false
                        return
                    }
                    // Check the answer!
                    if differenceGiven == correctDifference {
                
                        // Celebrate! 👍🏼
                        answerCorrect = true
                    } else {
                
                        // Sadness, they gave a number, but it's correct 😭
                        answerCorrect = false
                    }
                }, label: {
                    Text("Check Answer")
                        .font(.largeTitle)
                })
             
                //Only show when this buttom when an answer has not been check
                    .opacity(answerChecked ? 0.0 : 1.0)
                    .padding()
                    .buttonStyle(.bordered)
                Button(action: {
                    minuend = Int.random(in: 1...144)
                    subtrahend = Int.random(in: 1...minuend)
                    answerChecked = false
                    answerCorrect = false
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
             
                //Only show this button when an answer has been check
                    .opacity(answerChecked ? 1.0 : 0.0)
            }
       
            // Reaction animation
            ZStack {
                LottieView(animationNamed: "51926-happy")
                    .padding()
                    .opacity(answerCorrect ? 1.0 : 0.0)
                LottieView(animationNamed: "84655-swinging-sad-emoji")
                    .padding()
                    .opacity(answerChecked && !answerCorrect ? 1.0 : 0.0)
            }
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
   
        // Closure (block of code) will run once when the view is loaded
        .task {
            subtrahend = Int.random(in: 1...minuend)
        }
    }
}

struct SubtractionView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionView()
    }
}
