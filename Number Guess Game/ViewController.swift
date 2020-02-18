//
//  ViewController.swift
//  Number Guess Game
//
//  Created by Student on 2020-02-17.
//  Copyright © 2020 Kaiyum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let p = Player(PlayerName: "Abdul")
//        print(p.GetPlayerName())
        
        for i in 1...3{
            let testLevel = GameLevel(levelNo: 1, sliderValues: RangeValues(from: 1, to: 100), scope: 80)
           testLevel.SetRandomNumber()
        }
    }


}

