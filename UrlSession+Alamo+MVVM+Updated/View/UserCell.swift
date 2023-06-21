//
//  UserCell.swift
//  UrlSession+Alamo+MVVM+Updated
//
//  Created by MD Faizan on 19/06/23.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTiltle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    var modelUser:UserModel? {
        didSet {
            userConfiguration()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userConfiguration() {
        
        if let id = modelUser?.id {
            lblID.text = "\(id)"
        }else{
            lblID.text = "No id"
        }
        
        lblTiltle.text = modelUser?.title
        
        let status = modelUser?.getStatusColour()
        
        lblStatus.text = status?.0
        backgroundColor = status?.1
        
    }
    
}
