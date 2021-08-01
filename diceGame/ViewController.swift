//
//  ViewController.swift
//  diceGame
//
//  Created by water on 2021/8/1.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var diceButton: UIButton!
    @IBOutlet weak var winLoseLabel: UILabel!
    @IBOutlet weak var diceMoneyLabel: UILabel!
    @IBOutlet weak var diceStepper: UIStepper!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var choseImage: UIImageView! //選擇的水果
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var color1View: UIView!
    
    var diceMoney:Int = 0 //下注的錢
    var money:Int = 1000   //一開始的金額
    var diceNumber:Int = 1      //一開始骰子的數字
    var choseNumber:Int = 0 //預設選擇骰子的數字
     
    let formatter = NumberFormatter()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        moneyLabel.text = String(money)
        turnOndiceButton()
       // moneyLabel.text = " \(money)" // 一開始的金額寫到Label
       // formatter.maximumFractionDigits = 0 //把小數點去掉
       // diceMoneyLabel.text = formatter.string(from: NSNumber(value: diceMoney))
        colorView.layer.cornerRadius = 20
        color1View.layer.cornerRadius = 20
        diceStepper.layer.cornerRadius = 10
        diceButton.setImage(UIImage(named: "fruit"), for: .normal)
        
    }
    
    //下注開關打開
    func turnOndiceButton(){
        diceButton.isEnabled = true
    }
    
    //下注開關關閉
    func turnOffdiceButton(){
        diceButton.isEnabled = false
    }
    
    
    @IBAction func changemoney(_ sender: Any) {
        diceStepper.maximumValue = Double(money)
        diceMoney = Int(diceStepper.value)
        diceMoneyLabel.text = " \(diceMoney)"
        if diceMoney == money {
            turnOndiceButton()
        }
        return
    }
    
    
    @IBAction func choosedice(_ sender: UIButton ) {
        switch sender {
        case oneButton:
            choseImage.image = UIImage(named: "fruit01")
            choseNumber = 1
        case twoButton:
            choseImage.image = UIImage(named: "fruit02")
            choseNumber = 2
        case threeButton:
            choseImage.image = UIImage(named: "fruit03")
            choseNumber = 3
        case fourButton:
            choseImage.image = UIImage(named: "fruit04")
            choseNumber = 4
        case fiveButton:
            choseImage.image = UIImage(named: "fruit05")
            choseNumber = 5
        case sixButton:
            choseImage.image = UIImage(named: "fruit06")
            choseNumber = 6
        default:
        break
        }
        return
    }
    
    
    @IBAction func startgame(_ sender: UIButton) {
        diceNumber = Int.random(in: 1...6)
        if choseNumber == 0 {
            winLoseLabel.text = "請選擇水果"
        }   else if diceMoney == 0 {
            winLoseLabel.text = "請押注"
        }
        
        else {
        switch diceNumber {
        case 1:
            diceButton.setImage(UIImage(named: "fruit01"), for: .normal)
        case 2:
            diceButton.setImage(UIImage(named: "fruit02"), for: .normal)
        case 3:
            diceButton.setImage(UIImage(named: "fruit03"), for: .normal)
        case 4:
            diceButton.setImage(UIImage(named: "fruit04"), for: .normal)
        case 5:
            diceButton.setImage(UIImage(named: "fruit05"), for: .normal)
        case 6:
            diceButton.setImage(UIImage(named: "fruit06"), for: .normal)
        default:
        break
        }
        
        //判斷選擇的水果是否相同
        if choseNumber == diceNumber {
            winLoseLabel.text = "You Win"
            money = money + diceMoney
            moneyLabel.text = String(money)
        } else {
            winLoseLabel.text = "You Lose"
            money = money - diceMoney
            moneyLabel.text = String(money)
        }
            
        //判斷如果餘額小於0就無法再玩
        if money <= 0 {
            turnOffdiceButton()
            winLoseLabel.text = "沒有餘額，歡迎再來挑戰"
        }
        //判斷如果押注大於餘額就無法再玩
           else if diceMoney > money {
                turnOffdiceButton()
                winLoseLabel.text = "餘額不足，請減少押注"
            }
            
        }
        return
    }
    
    
    @IBAction func again(_ sender: Any) {
        money = 1000 // 儲值500
        moneyLabel.text = String(money)
        diceStepper.maximumValue = Double(money) // 重設餘額500
        turnOndiceButton()
        winLoseLabel.text = "歡迎再度光臨"
        diceButton.setImage(UIImage(named: "fruit"), for: .normal)
    }
    

}

