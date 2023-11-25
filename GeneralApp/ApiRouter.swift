//
//  ApiRouter.swift
//  GeneralApp
//
//  Created by abdallah mansour on 15/11/2023.
//

import Alamofire

class ApiRouter {
    static let shared = ApiRouter()
    func LogInApi(phone: String,password:String,code:String,completion: @escaping(logInDataModel?) -> Void) {
        let url = "https://ekceer.com/api/v1/user/login"
        let parameters = ["phone":phone,"country_code":code,"device_type":"ios","device_id":"987654","password":password]
        AF.request(url,method: .post,parameters: parameters).response { [weak self] response in
            guard let self = self else {return}
            switch response.result {
            case .success(_):
                guard let data = response.data else {return}
                do {
                    let JsonData = try JSONDecoder().decode(logInDataModel.self , from: data)
                    print(JsonData)
                }catch{
                    print(error)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func CountryApi(compeltion:(countryCodeModel?)-> Void){
        let url = "https://ekceer.com/api/v1/user/countries"
        AF.request(url,method: .get).response { [weak self ] response in
            guard let self = self else {return}
            switch response.result{
            case .success(_):
                guard let data = response.data else {return}
                do{
                    let JosnData = try JSONDecoder().decode(countryCodeModel.self, from: data)
                    print(JosnData)
                }catch{
                    print(error)
                    
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

