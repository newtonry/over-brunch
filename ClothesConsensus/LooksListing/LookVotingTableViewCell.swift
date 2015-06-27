//
//  LookVotingTableViewCell.swift
//  ClothesConsensus
//
//  Created by Ryan Newton on 4/1/15.
//  Copyright (c) 2015 ___clothesconsensus___. All rights reserved.
//

import UIKit

protocol LookVotingTableViewCellDelegate {
    func onVoteSliderSlid(cellSlid: UITableViewCell, voteValue: Float)
    
}


class LookVotingTableViewCell: UITableViewCell {
    var delegate: LookVotingTableViewCellDelegate?
    

    @IBOutlet weak var votingSlider: UISlider!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSlider()
        setupStyles()
    }
    
    func setupStyles() {
        self.selectionStyle = UITableViewCellSelectionStyle.None
    
    }
    
    func setupSlider() {
        let heartImage = UIImage(named: "heart")
        votingSlider.setThumbImage(heartImage, forState: UIControlState.Normal)
        
        let currentSliderBounds = votingSlider.frame
        let newFrame = CGRect(x: currentSliderBounds.origin.x, y: currentSliderBounds.origin.y, width: currentSliderBounds.width, height: currentSliderBounds.height + 50)

        votingSlider.trackRectForBounds(newFrame)
        votingSlider.minimumTrackTintColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha:1)
        votingSlider.maximumTrackTintColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha:1)
        
    }
    
    
    @IBAction func onVoteSliderSlid(sender: UISlider) {
        let voteValue = sender.value
        self.delegate?.onVoteSliderSlid(self, voteValue: voteValue)
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
