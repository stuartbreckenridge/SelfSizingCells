//
//  SongCell.swift
//  XMLExample
//
//  Created by Stuart Breckenridge on 14/8/14.
//  Copyright (c) 2014 Stuart Breckenridge. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {

    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appPrice: UILabel!
    @IBOutlet weak var appSummary: UILabel!
    @IBOutlet weak var appRights: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // MARK: Required for self-sizing cells.
        self.appName.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
        self.appRights.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
        self.appPrice.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
        self.appSummary.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // MARK: Required for self-sizing cells and device orientation
        self.appName.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
        self.appRights.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
        self.appPrice.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
        self.appSummary.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)
    }
}
