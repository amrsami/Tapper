//
//  ViewController.swift
//  Tapper
//
//  Created by Amr Sami on 1/23/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howMenyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tabBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        
        currentTaps++
        updateTapsLbl()
        
        if isGameOver() {
            restartGame()
        }
        
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        if howMenyTapsTxt.text != nil && howMenyTapsTxt.text != "" {
            
            logoImg.hidden = true
            playBtn.hidden = true
            howMenyTapsTxt.hidden = true
            
            tapsLbl.hidden = false
            tabBtn.hidden = false
            
            maxTaps = Int(howMenyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLbl()
            
        }
        
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howMenyTapsTxt.text = ""
        
        logoImg.hidden = false
        playBtn.hidden = false
        howMenyTapsTxt.hidden = false
        
        tapsLbl.hidden = true
        tabBtn.hidden = true

        
    }
    
    func updateTapsLbl() {
        tapsLbl.text = "\(currentTaps) Taps"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.howMenyTapsTxt.delegate = self
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

