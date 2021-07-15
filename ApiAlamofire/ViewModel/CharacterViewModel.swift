//
//  CharacterViewModel.swift
//  ApiAlamofire
//
//  Created by The Dat on 7/13/21.
//

import Foundation
import SDWebImage

class CharacterViewModel {
    
    
    // MARK: - BIEN
    private var userInfoList: [UserInfo] = []
    private let production = Production()
    private let detailCharacterVC = DetailCharacterVC()
    var needReloadTableView: (() -> Void)?
    
    // MARK: - func
    func requestData() {
        self.production.getAllCharacter(endPoint: "character")
        production.needReloadTable = { [weak self] userInforList in
            guard let strongSelf = self else { return }
            strongSelf.userInfoList = userInforList
            strongSelf.needReloadTableView?()
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return userInfoList.count
    }

    func cellForRowAt(indexPath: IndexPath) -> UserInfo {
        return userInfoList[indexPath.row]
    }
    
    func didSelectRowAt(indexPath: IndexPath) -> UserInfo {
        return userInfoList[indexPath.item]
    }
}
