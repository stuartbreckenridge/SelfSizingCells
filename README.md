SwiftXMLandSelfSizingCells
==========================

>This app is an example of parsing XML (the top 25 iTunes Apps list) with Swift and self-sizing cells. It is a work in progress because self-sizing cells are still a little buggy. **If you find bugs, please raise issues.**


###XMLParser.swift

This class contains one protocol, `XMLParserNotifications`, which contains one delegate method: `func didFinishParsingDocument(songs:[Song])`. This is used to notify delegates that parsing has finished and passes an array of parsed `[App]`s.

A `App` is a `struct` that contains a parsed app name, summary, price and rights

###AppCell.swift

This is custom subclass of `UITableViewCell`.

It contains four labels for an app's name, summary, price and rights.

In `func awakeFromNib()` and `func layoutSubviews()` there is code related to ensuring that the cells will self-size correctly with multiple `UILabel`s:

`// MARK: Required for self-sizing cells.`

`self.appName.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)`

`self.appRights.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)`

`self.appPrice.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)`

`self.appSummary.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)`

Commenting out any of the above will break self-sizing.

**N.B.**:All labels have their `numberOfLines` variable set to 0 in Storyboard.


###ViewController.swift

The view controller is a `XMLParserNotifications` delegate. When it receives the ` func didFinishParsingApps(apps:[App])` call it reloads its table view.

The following two lines of code are required for self-sizing cells:

`appTableView.estimatedRowHeight = 110.0`

`appTableView.rowHeight = UITableViewAutomaticDimension`

###Result:
![Image](https://www.dropbox.com/s/npr771sgdqumyi6/iOS%20Simulator%20Screen%20Shot%2015%20Aug%202014%209.28.31%20am.png?dl=1)




