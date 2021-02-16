//
//  HelpViewController.swift
//  CalcuApp
//
//  Created by koji nakashima on 2021/01/18.
//

import UIKit

var bool1 = true

class HelpViewController: UIViewController, UITextFieldDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        // totalKeyが存在したら読み込み
        if (UserDefaults.standard.object(forKey: "totalKey") as? String) != nil {
            // labelに表示
            label.text = (UserDefaults.standard.object(forKey: "totalKey") as? String)
            print("初期値：label=\(String(describing: label.text))")
        }
        // londDivisionKeyが存在したら読み込み
        if let x = UserDefaults.standard.object(forKey: "londDivisionKey") as? Bool{
            bool1 = x
            if bool1 == true {
                swlabel.text = "ON"
            } else {
                swlabel.text = "OFF"
            }
            switch1.isOn = bool1
            print("初期値：bool1=\(bool1)")
        }
    }
    // 戻る
    @IBAction func modoruButton(_ sender: Any) {
        // １つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    // textFieldへの文字制限
    var maxLength: Int = 2
    @objc func textFieldEditingChanged(textField: UITextField) {
        guard let text = textField.text else { return }
        textField.text = String(text.prefix(maxLength))
    }
    //  問題数を表示
    @IBAction func registerButton(_ sender: Any) {
        //UserDefaultsに値を登録
        if textField.text == "" {
            textField.text = "10"
        }
        if textField.text == "00" {
            textField.text = "01"
        }
        UserDefaults.standard.set(textField.text, forKey: "totalKey")
        //登録された値を表示する
        label.text = (UserDefaults.standard.object(forKey: "totalKey") as! String)
    }
    // ON OFF
    @IBOutlet weak var swlabel: UILabel!
    @IBOutlet weak var switch1: UISwitch!
    @IBAction func switchA1(_ sender: UISwitch) {
        if switch1.isOn == true{
            bool1 = true
            swlabel.text = "ON"
            UserDefaults.standard.set(bool1, forKey: "londDivisionKey")
            UserDefaults.standard.synchronize()
        }
        else{
            bool1 = false
            swlabel.text = "OFF"
            UserDefaults.standard.set(bool1, forKey: "londDivisionKey")
            UserDefaults.standard.synchronize()
        }
        print(" bool1=\(bool1)")
    }
    //画面をタップした時
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードを閉じる
        textField.resignFirstResponder()
    }
}
