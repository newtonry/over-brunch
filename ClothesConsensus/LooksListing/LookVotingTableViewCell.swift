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


class LookVotingTableViewCell: UITableViewCell, UIGestureRecognizerDelegate {

    @IBOutlet weak var lookImageView: UIImageView!
    @IBOutlet weak var votingSlider: UISlider!
    
    var delegate: LookVotingTableViewCellDelegate?
    var look: Look?
    var startingPoint: CGPoint = CGPoint()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSlider()
        setupGestureRecognizer()
        setupStyles()
    }
    
    func setFromLook(look: Look) {
        self.look = look
        var placeHolderImage = UIImage(named: "img-placeholder")
        lookImageView.setImageWithURL(look.imageUrl, placeholderImage: placeHolderImage)
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
        
        let grayBarColor = UIColor(red: 0.867, green: 0.867, blue: 0.867, alpha:1)
        votingSlider.minimumTrackTintColor = grayBarColor
        votingSlider.maximumTrackTintColor = grayBarColor
    }
    
    func setupGestureRecognizer() {
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onPan:")
        lookImageView.userInteractionEnabled = true
        lookImageView.addGestureRecognizer(panGestureRecognizer)
    }
    
    
    @IBAction func onVoteSliderSlid(sender: UISlider) {
        let voteValue = sender.value
        self.delegate?.onVoteSliderSlid(self, voteValue: voteValue)
    }
    
    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Began {
            startingPoint = sender.locationInView(self)
        } else if sender.state == UIGestureRecognizerState.Changed {
            var currentPoint = sender.locationInView(self)
            var difference = calculateVotingValueFromPoints(startingPoint, endingPoint: currentPoint)
            setSliderPositionBasedOnVotingValue(difference)
        } else if sender.state == UIGestureRecognizerState.Ended {
            var currentPoint = sender.locationInView(self)
            var difference = calculateVotingValueFromPoints(startingPoint, endingPoint: currentPoint)
        }
    }

    func calculateVotingValueFromPoints(startingPoint: CGPoint, endingPoint: CGPoint) -> CGFloat {
        var horizontalDifference = endingPoint.x - startingPoint.x
        var halfViewWidth = self.bounds.size.width / 2
        return horizontalDifference / halfViewWidth
    }
    
    func setSliderPositionBasedOnVotingValue(voteValue: CGFloat) {
        votingSlider.value = Float(CGFloat(0.5) + voteValue)
        self.delegate?.onVoteSliderSlid(self, voteValue: Float(voteValue))
    }
    
    @IBAction func sliderSliding(sender: UISlider) {
        if (sender.value < 0.5) {
            // If it's negative
            let trueValue = (0.5 - sender.value) * 2
        } else {
            // If it's positive
            let trueValue = (sender.value - 0.5) * 2
        }
    }    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
