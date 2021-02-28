//
//  SecondPageViewController.swift
//  HorseTech(remasted)
//
//  Created by Paul James on 09.01.2021.
//


import UIKit
import RealmSwift

class SecondPageViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    
    let header = "Давай знакомиться!"
    let subHearder = "Как вас зовут?"
    let person = Person()
    var namePlaceholder = nil ?? "Ваше имя" //тут мы берем имя из юзерВК и передаем в плейсхолдер. При первом запуске тк у нас значение будет пустое сработает нил и будет выполнено второе значение 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = header
        subHeaderLabel.text = subHearder
        
        
        imageView.image = UIImage(named: "Bike2")
        
        //настройка текстФилда
        setupTextField()
        
        //настройки кнопки
        setupButton()
        skipButtonSetup()
        
        //настройка кнопки перед тем как текстФилд еще не заполнен
        button.isHidden = true
        
//        textField.becomeFirstResponder()
        }
    
    func setupTextField() {
        textField.delegate = self
        textField.placeholder = namePlaceholder
        textField.returnKeyType = .done
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 15
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        
        
    }
    
    //клава прячется после нажатия на "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //проверка текстфилда на наличие или отсутсвие текста + появление или исчезновение кнопки
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        
        if validate(text: sender.text!) {
            button.isHidden = true
        } else {
            button.isHidden = false
        }
    }
    
    //проверка текста в текстФилде
    func validate(text: String) -> Bool {
        return text == ""
    }
    
    
    func setupButton() {
        button.layer.cornerRadius = 15
        button.clipsToBounds = true //если мы это не напишем, то у нас останется такая же прямоугольная кнопка как и была
        button.layer.borderWidth = 2
        button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        button.layer.borderColor = (#colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)).cgColor
        button.setTitle("  Далее  ", for: .normal)
        
    }
    
    func skipButtonSetup(){
        skipButton.layer.cornerRadius = 15
        skipButton.clipsToBounds = true
        skipButton.layer.borderWidth = 2
        skipButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        skipButton.layer.borderColor = (#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)).cgColor
        skipButton.setTitle("  Назад  ", for: .normal)
    }
    
    

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        guard let title = textField.text, !title.isEmpty else {return}
       
        let name = person
        name.name = title
        
    StorageManagerName.saveObject(name)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    @IBAction func skipButtonPressed() {
        dismiss(animated: true, completion: nil)
    }

}
