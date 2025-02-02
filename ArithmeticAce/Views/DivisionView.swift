//
//  DivisionView.swift
//  ArithmeticAce
//
//  Created by Noah Soubliere on 2022-02-07.
//

import SwiftUI

struct DivisionView: View {
    
    // MARK: Stored properties
    @State var divisor = Int.random(in: 1...12)
    @State var correctQuotient = Int.random(in: 1...12)
  
    //what the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var dividend: Int {
        return correctQuotient * divisor
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                Text("÷")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(dividend)")
                    Text("\(divisor)")
                }
            }
            
            Divider()
            
            HStack {
                
                ZStack{
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                    //        CONDITION      true  false
                        .opacity(answerCorrect ? 1.0 : 0.0)
                    
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                    //CONDITION   AND   Condition            true  false
                        .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
                }
                Spacer()
                TextField("",
                          text: $inputGiven)
                    .multilineTextAlignment(.trailing)
            }
            ZStack {
                Button(action: {
                    
                    // Answer has been checked!
                    answerChecked = true
                    
                    // Convert the input given to an integer, if possible
                    guard let quotientGiven = Int(inputGiven) else {
                        // Sadness, not a number
                        answerCorrect = false
                        return
                    }
                    
                    // Check the answer!
                    if quotientGiven == correctQuotient {
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
                    .padding()
                    .buttonStyle(.bordered)
                //only show this button when an answer has not been checked
                    .opacity(answerChecked == false ? 1.0 : 0.0)
         
                Button(action: {
                    //generate new question
                    divisor = Int.random(in: 1...12)
                    correctQuotient = Int.random(in: 1...12)
                    //resset properties that track whats happening with the current question
                    
                    answerChecked = false
                    answerCorrect = false
                    
                    //reset the input field
                    inputGiven = ""
                }, label: {
                    Text("New Question")
                        .font(.largeTitle)
                       
                })
                 
                    .padding()
                    .buttonStyle(.bordered)
                    //only show this button when an answer has been checked
                    .opacity(answerChecked == true ? 1.0 : 0.0)
            }

            
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        
        
    }
}

struct DivisionView_Previews: PreviewProvider {
    static var previews: some View {
        DivisionView()
    }
}

