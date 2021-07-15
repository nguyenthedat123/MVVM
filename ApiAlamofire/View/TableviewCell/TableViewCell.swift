//
//  TableViewCell.swift
//  ApiAlamofire
//
//  Created by The Dat on 7/7/21.
//

import UIKit


class TableViewCell: UITableViewCell {

    //MARK: - @IBOutlet
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK: - func
    func bindData(data: UserInfo) {
        lbName.text = data.name
        lbGender.text = data.gender
        imgAvatar.sd_setImage(with: URL(string: data.image!), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
}
