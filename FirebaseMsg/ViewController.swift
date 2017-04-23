//
//  ViewController.swift
//  FirebaseMsg
//
//  Created by 현식 김 on 2017. 4. 19..
//  Copyright © 2017년 현식 김. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var resultView: UITextView!

    @IBAction func Button(_ sender: Any) {
        if(!id.text!.isEmpty && !password.text!.isEmpty){
            let idString = id.text!
            let passString = password.text!
            resultView.text = (idString) + " is "  + (passString)
            print(idString,passString)
            
        } else if(id.text!.isEmpty && !password.text!.isEmpty){
            resultView.text = "One parameter is empty"
        }
    }
    
}

