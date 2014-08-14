SwiftXMLandSelfSizingCells
==========================

This app is an example of parsing XML (the top 30 iTunes Song list) with Swift and self-sizing cells. 

###XMLParser.swift

This class contains one protocol, `XMLParserNotifications`, which contains one delegate method: `func didFinishParsingDocument(songs:[Song])`. This is used to notify delegates that parsing has finished and passes an array of parsed `[Song]`s.

A `Song` is a `struct` that contains a parsed song title and the song rights.

###SongCell.swift

This is custom subclass of `UITableViewCell`.

It contains two labels for Song Title and Song Rights.

In `func awakeFromNib()` there is code related to ensuring that the cells will self-size correctly with multiple `UILabel`s:

`self.songLabel.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)`

`self.rightsLabel.preferredMaxLayoutWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow.frame)`

Commenting out any of the above will break self-sizing.

**N.B.**:`songLabel` and `rightsLabel` have their `numberOfLines` variable set to 0 in Storyboard.


###ViewController.swift

The view controller is a `XMLParserNotifications` delegate. When it receives the `didFinishParsingDocument(songs:[Song])` call it reloads its table view.

The following two lines of code are required for self-sizing cells:

`songTableView.estimatedRowHeight = 70.0`

`songTableView.rowHeight = UITableViewAutomaticDimension`

###Result:
<center><img src="https://www.dropbox.com/s/6qma737gklclw88/iOS%20Simulator%20Screen%20Shot%2014%20Aug%202014%208.38.38%20am.png?dl=1" width="320px" height="568px" /></center>




