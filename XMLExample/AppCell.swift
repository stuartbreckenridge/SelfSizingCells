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
        self.appName.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
        self.appRights.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
        self.appPrice.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
        self.appSummary.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // MARK: Required for self-sizing cells and device orientation
        self.appName.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
        self.appRights.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
        self.appPrice.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
        self.appSummary.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
    }
    
    func populateCell(#appData:App)
    {
        self.appName.text = appData.appName
        self.appName.accessibilityLabel = "Application Name"
        self.appName.accessibilityValue = appData.appName
        self.appName.isAccessibilityElement = true
        
        self.appPrice.text = appData.appPrice
        self.appPrice.accessibilityLabel = "Application Price in U.S. Dollars"
        self.appPrice.accessibilityValue = appData.appPrice
        self.appPrice.isAccessibilityElement = true
        
        self.appRights.text = appData.appRights
        self.appRights.accessibilityLabel = "Application Rights Holder"
        self.appRights.accessibilityValue = appData.appRights
        self.appRights.isAccessibilityElement = true
        
        self.appSummary.text = appData.appSummary
        self.appSummary.accessibilityLabel = "Application Description"
        self.appSummary.accessibilityValue = appData.appSummary
        self.appSummary.isAccessibilityElement = true
    }
}
