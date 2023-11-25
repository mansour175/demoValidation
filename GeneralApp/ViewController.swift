//
//  ViewController.swift
//  GeneralApp
//
//  Created by abdallah mansour on 14/11/2023.
//

import UIKit
import Alamofire

final class ViewController: UIViewController {
    
    //MARK: -IbOutlets
    @IBOutlet weak var phonetextFiled: UITextField!
    
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBOutlet weak var CountryCodeTextFiled: UITextField!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    //MARK: - Properties
    private var picker = UIPickerView()
    private var countryModel:[countryModel] = []
    
    //MARK: - LifeCycle Evants -
    override func viewDidLoad() {
        super.viewDidLoad()
        CountryCodeApi()
        RigsterPickerView()
    }
    //MARK: - Configure Ui
    
    
    
    //MARK: - IBActions
    @IBAction func logIn(_ sender: Any) {
        do{
            let phone = try Validations.shared.PhoneNumberValidation(phone: phonetextFiled.text)
            let password = try Validations.shared.PasswordNumberValidation(Password: passwordTextFiled.text)
            let code = try Validations.shared.CountryCodeValidation(code: CountryCodeTextFiled.text)
            LoginApi(phone: phone, password: password, code: code)
        }catch{
            let alert = UIAlertController(title: "error alert", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title:"ok", style: .default,handler: nil))
            self.present(alert, animated: true)
        }
    }
}
//MARK: - Picker View
extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryModel.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryModel[row].key
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CountryCodeTextFiled.text = countryModel[row].key
        CountryCodeTextFiled.resignFirstResponder()
    }
    func RigsterPickerView(){
    picker.delegate = self
    picker.dataSource = self
    CountryCodeTextFiled.inputView = picker
}
}




//MARK: - Networking
extension ViewController {
    
    private func LoginApi(phone:String,password:String,code:String){
        ApiRouter.shared.LogInApi(phone: phone, password: password, code: code) { response1 in
            print(response1)
        } 
    }
    private func CountryCodeApi(){
        indicator.startAnimating()
        ApiRouter.shared.CountryApi{[weak self] response2 in
            guard let self = self else {return}
            self.countryModel = response2?.data ?? []
            self.indicator.stopAnimating()
        }
        
    }
}

