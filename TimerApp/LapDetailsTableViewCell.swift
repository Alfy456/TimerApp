//
//  LapDetailsTableViewCell.swift
//  TimerApp
//
//  Created by user209728 on 1/12/22.
//

import UIKit

class LapDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var lapDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //fn to setup lap details in the cell
    func setLapCell(obj:String){
        lapDetails.text = obj
    }
}
