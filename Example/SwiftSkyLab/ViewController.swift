//
//  ViewController.swift
//  SwiftSkyLab
//
//  Created by fuyoufang on 07/17/2020.
//  Copyright (c) 2020 fuyoufang. All rights reserved.
//

import UIKit
import SwiftSkyLab

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        reset()
        test()
    }
    
    func test() {
        // Simple A/B Test
        SwiftSkyLab.abTest("Test1", A: {
            print("Test1 - A")
        }, B: {
            print("Test1 - B")
        })
        
        // Split Test with Weighted Probabilities
        SwiftSkyLab.splitTest("Test2", conditions: [
            "Red" : 0.15,
            "Green" : 0.10,
            "Blue" : 0.50,
            "Purple" : 0.25
        ]) { (choice) in
            print("Test2 - \(choice ?? "None")")
        }
        
        SwiftSkyLab.splitTest("Test4", conditions: [
            "Red",
            "Green",
            "Blue",
            "Purple"
        ]) { (choice) in
            print("Test4 - \(choice ?? "None")")
        }
        
        // Multivariate Test
        SwiftSkyLab.multivariateTest("Test5", variables: [
            "Red" : 0.15,
            "Green" : 0.10,
            "Blue" : 0.50,
            "Purple" : 0.25
        ]) { (activeVariables) in
            print("Test5 - \(activeVariables)")
        }
        
        SwiftSkyLab.multivariateTest("Test3", variables: [
            "Red",
            "Green",
            "Blue",
            "Purple"
        ]) { (activeVariables) in
            print("Test3 - \(activeVariables)")
        }
    }
    
    func reset() {
        SwiftSkyLab.resetTest("Test1")
        SwiftSkyLab.resetTest("Test2")
        SwiftSkyLab.resetTest("Test3")
        SwiftSkyLab.resetTest("Test4")
        SwiftSkyLab.resetTest("Test5")
    }
    
}


