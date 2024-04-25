//
//  ViewController.swift
//  Counter
//
//  Created by Богдан Топорин on 25.04.2024.
//

import UIKit

class ViewController: UIViewController {
    private var num: Int = 0
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var checkButtonMinus: UIButton!
    @IBOutlet weak var checkButtonPlus: UIButton!
    @IBOutlet weak var checkButtonReset: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    func update (with text: String){
        let template = "yMMMMd"
        let ruLocale = Locale(identifier: "ru_RU")
        let ruDataFormat = DateFormatter()
        ruDataFormat.locale = ruLocale
        ruDataFormat.setLocalizedDateFormatFromTemplate(template)
        let dataString = ruDataFormat.string(from: Date())
        historyTextView.text.append("\(dataString): \(text)\n")
        historyTextView.scrollRangeToVisible(NSMakeRange(historyTextView.text.count - 1, 0))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.text = "Значение счетчика: \(num)"
        historyTextView.text = "История изменений\n"
        checkButtonPlus.backgroundColor = .red
        checkButtonMinus.backgroundColor = .blue
        
    }
    @IBAction func buttonDidAppear(_ sender: Any) {
        num += 1
        numLabel.text = "Значение счетчика: \(num)"
    }
    @IBAction func buttonMinusDidAppear(_ sender: Any) {
        if num > 0 {
            num -= 1
            numLabel.text = "Значение счетчика: \(num)"
            update(with: "Значение изменено на -1")
        }
        else{
            update(with: "Попытка уменьшить значение счетчика ниже 0")
        }
    }
    @IBAction func buttonPlusDidAppear(_ sender: Any) {
        num += 1
        numLabel.text = "Значение счетчика: \(num)"
        update(with: "Значение изменено на +1")
    }
    
    @IBAction func buttonResetDidAppear(_ sender: Any) {
        num = 0
        numLabel.text = "Значение счетчика: \(num)"
        update(with: "Значение было сброшено")
    }
    
}

