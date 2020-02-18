//
//  GameLevel.swift
//  Number Guess Game
//
//  Created by Abdulkaiyum on 2020-02-17.
//  Copyright © 2020 Kaiyum. All rights reserved.
//

import Foundation

struct RangeValues{
    var min : Int
    var max : Int
    var randomNumber : Int!
    
    var range : ClosedRange<Int>
    
    init(from min : Int, to max : Int ) {
        self.min = min
        self.max = max
        self.range = min...max
//        default random number to mid value
        self.randomNumber = getMidNumber()
        
    }
    
    func getMidNumber() -> Int {
        return Int((max - min) / 2)
    }
    
    func SetRandomNumber() -> Int {
        var generator = SystemRandomNumberGenerator()
        return range.randomElement(using: &generator)!
    }
    
    func GetRandomNumber() -> Int {
        if let random = self.randomNumber {
            return random
        }
        else{
            return SetRandomNumber()
        }
    }
    
    func getRangeWidth() -> Int {
        return range.max()! - range.min()! + 1
    }
}
class GameLevel {
    var levelNo : UInt
    var valueRange : RangeValues
    var randomNumber : Int!
    var scoreRange : RangeValues!
    var guessedNumber : UInt!
    var scoreScopePerc: UInt // score scope percentage 5% to 100%
    
    init(levelNo : UInt, sliderValues range : RangeValues, scope scoreScopePerc : UInt ) {
        self.levelNo = levelNo
        self.valueRange = range
        self.randomNumber = valueRange.getMidNumber()
        self.scoreScopePerc = scoreScopePerc
//        Default set to value range
        self.scoreRange = range
    }
    
    func CalculateScore(number guessedNumber:Int) -> Int {
        let score : Int = 0
        
        return score
    }
    
    func getMinValue() -> Int {
        return valueRange.min
    }
    
    func getMaxValue() -> Int {
        return valueRange.max
    }
    
    func SetRandomNumber() -> Int {
//        setting up score range
        randomNumber = self.valueRange.SetRandomNumber()
        PrepareScoreRange()
       
        return randomNumber!
    }
    
    private func PrepareScoreRange(){
        let offset = ((Float(scoreScopePerc)/200) * Float(valueRange.getRangeWidth()))
        let lower = randomNumber - Int(offset)
        let upper = randomNumber + Int(offset)
        print("Offset \(offset)")
        print("Lower \(lower)")
        print("upper \(upper)")
        print("------")
        SetScoreRange(range: lower...upper)
    }
    private func SetScoreRange(range : ClosedRange<Int>) {
        self.scoreRange.range = valueRange.range.clamped(to: range)
        print("score Range \(scoreRange.range)")
    }
    
    func GetRandomNumber() -> Int {
        return self.valueRange.GetRandomNumber()
    }
    
    func CaculateScore(GuessedNumber number: Int) -> Int {
        var score = 100;
            
        if(number == randomNumber!){
            score = 100
        }
        else if(number < randomNumber){
            
        }else if (number > randomNumber){
            
        }
        
        return score
    }
}
