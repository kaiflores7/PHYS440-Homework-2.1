//
//  quadratics.swift
//  Homework 2.1
//
//  Created by Katia Flores on 2/4/22.
//

import Foundation
import SwiftUI

class quadratics: NSObject, ObservableObject {
    // first formula given
    var a = 0.0
    var b = 0.0
    var c = 0.0
    @Published var enableButton = true
    @Published var res1 = 0.0
    @Published var res2 = 0.0
    @Published var res3 = 0.0
    @Published var res4 = 0.0
    
    func initialize (valA: Double, valB: Double, valC: Double) {
        
        self.a = valA
        self.b = valB
        self.c = valC
        
        self.updateResults(
            result1: self.quadOnePositive(), result2: self.quadOneNegative(), result3: self.quadTwoPositive(), result4: self.quadTwoNegative()
        )
        
        setButtonEnable(state: true)
    }
    
    func quadOnePositive () -> Double {
    
        let rt = pow(Double(b),Double(2.0)) - (4.0 * a * c)
        let result1 = ( -b + sqrt(rt) ) / (2.0 * a )
    
        return result1
    }

    func quadOneNegative () -> Double {
    
        let rt = pow(Double(b),Double(2.0)) - (4.0 * a * c)
        let result2 = ( -b - sqrt(rt) ) / (2.0 * a )
    
        return result2
    }

    //second formula given
    func quadTwoPositive () -> Double {
    
        let rt = pow(Double(b),Double(2.0)) - (4.0 * a * c)
        let result3 = ( -2.0 * c ) / ( b + sqrt(rt) )
    
        return result3
    }

    func quadTwoNegative () -> Double {
    
        let rt = pow(Double(b),Double(2.0)) - (4.0 * a * c)
        let result4 = ( -2.0 * c ) / ( b - sqrt(rt) )
        
        return result4
    }
    
    func updateResults(result1: Double, result2: Double, result3: Double, result4: Double) {
        res1 = result1
        res2 = result2
        res3 = result3
        res4 = result4
    }
    
    func setButtonEnable(state: Bool){
        if state {
            Task.init {
                await MainActor.run {
                    self.enableButton = true
                }
            }
        }
        else {
            Task.init {
                await MainActor.run {
                    self.enableButton = false
                }
            }
        }
    }
}
