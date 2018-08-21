//
//  ViewController.swift
//  Tic Toc Toe
//
//  Created by WITZ on 8/16/18.
//  Copyright © 2018 WITZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var player = 1
    var playerWin = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var labelMsg: UILabel!
    
    func starGame(){ //
        playerWin = [[0, 0, 0] , [0, 0, 0], [0, 0, 0]]
        for button in buttons{
            button.setTitle(nil, for: UIControlState.normal)
        }
        player = 1
    }
    
    @IBAction func selectButton(_ sender: UIButton) {
        
        let rowIndex = sender.tag / 3
        let colIndex = sender.tag % 3
        
        if playerWin[rowIndex][colIndex] != 0 {
            return
        }

        playerWin[rowIndex][colIndex] = player
        
        if player == 1 {
            sender.setTitle("O", for: UIControlState.normal)
            player += 1
        } else if player == 2{
            sender.setTitle("X", for: UIControlState.normal)
            sender.setTitleColor(.red, for: UIControlState.normal)
            player = 1
        }
        
        let winner = thisNotWinner()
        
        switch winner {
        case 0:
            player = (player % 2) + 1
        case 1:
            labelMsg.text = "Player 1 is the winner!"

        case 2:
            labelMsg.text = "Player 2 is the winner!"
           
        default:
            labelMsg.text = "Game Stoped, We don't have Winner"
        }
    }

    
    @IBAction func playAgain(_ sender: UIButton) {
        starGame()
    }
    
    func thisNotWinner() -> Int {
        
        if playerWin[0][0] != 0 && playerWin[0][0] == playerWin[0][1] && playerWin[0][1] == playerWin[0][2] {
            return playerWin[0][0]
        }
        
        
        if playerWin[1][0] != 0 && playerWin[1][0] == playerWin[1][1] && playerWin[1][1] == playerWin[1][2] {
            return playerWin[1][0]
        }
        
        if playerWin[2][0] != 0 && playerWin[2][0] == playerWin[2][1] && playerWin[2][1] == playerWin[2][2] {
            return playerWin[2][0]
        }
        
        if playerWin[0][0] != 0 && playerWin[0][0] == playerWin[1][0] && playerWin[1][0] == playerWin[2][0] {
            return playerWin[0][0]
        }
        
        if playerWin[0][1] != 0 && playerWin[0][1] == playerWin[1][1] && playerWin[1][1] == playerWin[2][1] {
            return playerWin[0][1]
        }
        
        if playerWin[0][2] != 0 && playerWin[0][2] == playerWin[1][2] && playerWin[1][2] == playerWin[2][2] {
            return playerWin[2][2]
        }
        
        if playerWin[0][2] != 0 && playerWin[0][2] == playerWin [1][1] && playerWin[1][1] == playerWin[2][0] {
            return playerWin[2][0]
        }
        
        if playerWin[0][0] != 0 && playerWin[0][0] == playerWin[1][1] && playerWin[1][1] == playerWin[2][2]{
            return playerWin[2][2]
        }
        return 0
    }
}


// - Có bao nhiêu cách để unwrap 1 biến optional.
// - Dùng `as?` thay vì `as!`
// - Win
//


