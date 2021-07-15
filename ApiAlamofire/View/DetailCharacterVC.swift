//
//  DetailCharacterVC.swift
//  ApiAlamofire
//
//  Created by The Dat on 7/14/21.
//

import UIKit

class DetailCharacterVC: UIViewController {
        
    //MARK: - Bien
    var avatar : String = ""
    var name : String = ""
    var gender : String = ""
    var type : String = ""
    var status : String = ""
    var species : String = ""
    
    
    //MARK: - @IBOutlet
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var lbSpecies: UILabel!
    @IBOutlet weak var lbType: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imgAvatar.sd_setImage(with: URL(string: avatar), placeholderImage: UIImage(named: "placeholder.png"))
        lbName.text = name
        lbGender.text = gender
        lbType.text = type
        lbStatus.text = status
        lbSpecies.text = species
    }

    //MARK: - func
    func bindData(data: UserInfo) {
        avatar = data.image ?? ""
        name = data.name ?? ""
        gender = data.gender ?? ""
        type = data.type ?? ""
        status = data.status ?? ""
        species = data.species ?? ""
    }
}
//extension UIViewController {
//    static func initFromNib() -> Self {
//        func instanceFromNib<T: UIViewController>() -> T {
//            return T(nibName: String(describing: self), bundle: nil)
//        }
//        return instanceFromNib()
//    }
//}
