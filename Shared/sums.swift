//
//  sums.swift
//  Homework 2.1
//
//  Created by Katia Flores on 2/4/22.
//

import Foundation
import SwiftUI

class sums: NSObject, ObservableObject {
    
    var n = Int(0)
    @Published var enableButton = true
    @Published var sum1Final = Float(0)
    @Published var sum2Final = Float(0)
    @Published var sum3Final = Float(0)
    @Published var sumUpFinal = Float(0)
    @Published var sumDownFinal = Float(0)
    
    func initialize (valN: Int) {
        
        self.n = valN
        
        self.updateResults(
            sum1: self.sumOne(), sum2: self.sumTwo(), sum3: self.sumThree(), sumUpRes: self.sumUp(), sumDownRes: self.sumDown()
        )
        
        setButtonEnable(state: true)
    }
    
    func sumOne () -> Float {
        let end = 2 * n
        var sum1 = Float(0)
        var j = Float(0)
    
        for i in 1...end {
            let i = Float(i)
            j = pow(-1,i) * i / (i + 1)
            sum1 += j
        }
    
        return sum1
    }

    func sumTwo () -> Float {
        var j1 = Float(0)
        var j2 = Float(0)
        var sum2 = Float(0)
        
        for i in 1...n {
            let i = Float(i)
            j1 = (2 * i - 1) / (2 * i)
            j2 = (2 * i) / (2 * i + 1)
            sum2 += -j1 + j2
        }
    
        return sum2
    }

    func sumThree () -> Float {
        var j = Float(0)
        var sum3 = Float(0)
        
        for i in 1...n {
          let i = Float(i)
            j = 2 * i * (2 * i + 1)
            sum3 += 1/j
        }
    
        return sum3
    }

    func sumUp () -> Float {
        var j = Float(0)
        var sumUpRes = Float(0)
        
        for i in 1...n {
            let i = Float(i)
            j = 1 / i
            sumUpRes += j
        }
    
        return sumUpRes
    }

    func sumDown () -> Float {
        var j = Float(0)
        var sumDownRes = Float(0)
        
        for i in 1...n {
            let i = Float(i)
            j = 1 / i
            sumDownRes += j
        }
    
        return sumDownRes
    }
    
    func updateResults(sum1: Float, sum2: Float, sum3: Float, sumUpRes: Float, sumDownRes: Float) {
        sum1Final = sum1
        sum2Final = sum2
        sum3Final = sum3
        sumUpFinal = sumUpRes
        sumDownFinal = sumDownRes
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
