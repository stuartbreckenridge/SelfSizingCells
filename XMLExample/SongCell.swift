//
//  SongCell.swift
//  XMLExample
//
//  Created by Stuart Breckenridge on 14/8/14.
//  Copyright (c) 2014 Stuart Breckenridge. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var rightsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // MARK: Required for self-sizing cells.
        self.songLabel.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
        self.rightsLabel.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // MARK: Required for self-sizing cells and device orientation
        self.songLabel.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
        self.rightsLabel.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
        
    }

}
