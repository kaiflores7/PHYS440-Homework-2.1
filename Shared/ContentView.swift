//
//  ContentView.swift
//  Shared
//
//  Created by Katia Flores on 2/1/22.
//
import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var quad = quadratics()
    @ObservedObject private var sum = sums()
    @State private var givenA = "1.0"
    @State private var givenB = "4.0"
    @State private var givenC = "1.0"
    @State private var givenN = "1.0"
        
    var body: some View {
        HStack{
            Text("Quadratic tests")
            VStack{
                Text("Value of a")
                    .padding(.top)
                    .padding(.bottom, 0)
                TextField("Enter a", text: $givenA, onCommit: self.calculateQuad)
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom, 30)
            }
            VStack{
                Text("Value of b")
                    .padding(.top)
                    .padding(.bottom, 0)
                TextField("Enter b", text: $givenB, onCommit: self.calculateQuad)
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom, 30)
            }
            VStack{
                Text("Value of c")
                    .padding(.top)
                    .padding(.bottom, 0)
                TextField("Enter c", text: $givenC, onCommit: self.calculateQuad)
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom, 30)
            }
        }
        
        Button("Calculate Quadratic Formula", action: calculateQuad)
        
        VStack{
            Text("For X1")
                .padding(.bottom, 0)
            Text("\(quad.res1, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
        }
        VStack{
            Text("For X2")
                .padding(.bottom, 0)
            Text("\(quad.res2, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
        }
        VStack{
            Text("For X'1")
                .padding(.bottom, 0)
            Text("\(quad.res3, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
        }
        VStack{
            Text("For X'2")
                .padding(.bottom, 0)
            Text("\(quad.res4, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
        }
        
        HStack{
            Text("Summation tests")
            VStack{
                Text("Value of N")
                    .padding(.top)
                    .padding(.bottom, 0)
                TextField("Enter N", text: $givenN, onCommit: self.calculateSums)
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom, 30)
            }
        }
        
        Button("Calculate Summations", action: calculateSums)
        
        VStack{
            HStack{
                Text("S1")
                    .padding(.bottom, 0)
                Text("\(sum.sum1Final, specifier: "%.8f")")
                    .padding(.horizontal)
            }
            HStack{
                Text("S2")
                    .padding(.bottom, 0)
                Text("\(sum.sum2Final, specifier: "%.8f")")
                    .padding(.horizontal)
            }
            HStack{
                Text("S3")
                    .padding(.bottom, 0)
                Text("\(sum.sum3Final, specifier: "%.8f")")
                    .padding(.horizontal)
            }
        }
    }
    

    func calculateQuad()  {
        quad.setButtonEnable(state: false)
        
        let valueA = Double(givenA)!
        let valueB = Double(givenB)!
        let valueC = Double(givenC)!
        
        quad.initialize(valA: valueA, valB: valueB, valC: valueC)
 
    }

    func calculateSums()  {
        sum.setButtonEnable(state: false)
        
        let valueN = Int(givenN)!
        
        sum.initialize(valN: valueN)
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

        


