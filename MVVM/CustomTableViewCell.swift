//
//  CustomTableViewCell.swift
//  MVVM
//
//  Created by Sidhant Madan on 08/02/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    static let cellIdentifier = "CustomTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    public func configure(with viewModel: cellViewModel) {
        myLabel.text = "\(viewModel.firstName)  \(viewModel.lastName)"
    }
    
}
