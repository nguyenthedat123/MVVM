//
//  Configs.swift
//  ApiAlamofire
//
//  Created by The Dat on 7/7/21.
//

import Foundation
import Alamofire

class Production {
    
    //MARK: - URL Api
    static let BASE_URL: String = "https://rickandmortyapi.com/api/"
    
    //MARK: - Bien
    var needReloadTable: (( [UserInfo])-> Void)?
    
    //MARK: - func
    func getAllCharacter(endPoint:String) {
        AF.request(Production.BASE_URL + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { [weak self] (responseData) in
            guard let strongSelf = self,
                let data = responseData.data else {
                return
            }
            do {
                let character = try JSONDecoder().decode(BaseResponse.self, from: data)
                print("\(character)>>>>>>>>>")
                if let userInfoList = character.results {
                    strongSelf.needReloadTable?(userInfoList)
                }
            } catch {
                print("Error \(error)")
            }
    }
}

//enum NetworkErrorType {
//    case API_ERROR
//    case HTTP_ERROR
//}
}
