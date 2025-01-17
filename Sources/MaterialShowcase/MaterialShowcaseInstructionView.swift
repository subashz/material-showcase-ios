//
//  MaterialShowcaseInstructionView.swift
//  MaterialShowcase
//
//  Created by Andrei Tulai on 2017-11-16.
//  Copyright © 2017 Aromajoin. All rights reserved.
//

import Foundation
import UIKit

public class MaterialShowcaseInstructionView: UIView {
  
  internal static let PRIMARY_TEXT_SIZE: CGFloat = 20
  internal static let SECONDARY_TEXT_SIZE: CGFloat = 15
    internal static let THIRD_TEXT_SIZE: CGFloat = 12
  internal static let PRIMARY_TEXT_COLOR = UIColor.white
  internal static let SECONDARY_TEXT_COLOR = UIColor.white.withAlphaComponent(0.87)
  internal static let PRIMARY_DEFAULT_TEXT = "Awesome action"
  internal static let SECONDARY_DEFAULT_TEXT = "Tap here to do some awesome thing"
  
  public var primaryLabel: UILabel!
  public var secondaryLabel: UILabel!
  var thirdLabel: UILabel!

  public var thirdAttributedText: NSAttributedString?
  
  // Text
  public var primaryText: String!
  public var secondaryText: String!
  public var primaryTextColor: UIColor!
  public var secondaryTextColor: UIColor!
  public var primaryTextSize: CGFloat!
  public var secondaryTextSize: CGFloat!
  public var primaryTextFont: UIFont?
  public var secondaryTextFont: UIFont?
  public var primaryTextAlignment: NSTextAlignment!
  public var secondaryTextAlignment: NSTextAlignment!
  public var secondaryTextTopPadding: CGFloat = 0.0
  
  public init() {
    // Create frame
    let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0)
    super.init(frame: frame)
    
    configure()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  /// Initializes default view properties
  fileprivate func configure() {
    setDefaultProperties()
  }
  
  fileprivate func setDefaultProperties() {
    // Text
    primaryText = MaterialShowcaseInstructionView.PRIMARY_DEFAULT_TEXT
    secondaryText = MaterialShowcaseInstructionView.SECONDARY_DEFAULT_TEXT
    primaryTextColor = MaterialShowcaseInstructionView.PRIMARY_TEXT_COLOR
    secondaryTextColor = MaterialShowcaseInstructionView.SECONDARY_TEXT_COLOR
    primaryTextSize = MaterialShowcaseInstructionView.PRIMARY_TEXT_SIZE
    secondaryTextSize = MaterialShowcaseInstructionView.SECONDARY_TEXT_SIZE
  }
  
  /// Configures and adds primary label view
  private func addPrimaryLabel() {
    if primaryLabel != nil {
      primaryLabel.removeFromSuperview()
    }
    
    primaryLabel = UILabel()
    
    if let font = primaryTextFont {
      primaryLabel.font = font
    } else {
      primaryLabel.font = UIFont.boldSystemFont(ofSize: primaryTextSize)
    }
    primaryLabel.textColor = primaryTextColor
    primaryLabel.textAlignment = self.primaryTextAlignment ?? .left
    primaryLabel.numberOfLines = 0
    primaryLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
    //primaryLabel.text = primaryText
      
      primaryLabel.text =   NSLocalizedString(primaryText, comment: "")

      
    primaryLabel.frame = CGRect(x: 0,
                                y: 0,
                                width: frame.width,
                                height: 0)

    primaryLabel.sizeToFitHeight()
    addSubview(primaryLabel)
  }
  
  /// Configures and adds secondary label view
  private func addSecondaryLabel() {
    if secondaryLabel != nil {
      secondaryLabel.removeFromSuperview()
    }
    
    secondaryLabel = UILabel()
    if let font = secondaryTextFont {
      secondaryLabel.font = font
    } else {
      secondaryLabel.font = UIFont.systemFont(ofSize: secondaryTextSize)
    }
    secondaryLabel.textColor = secondaryTextColor
    secondaryLabel.textAlignment = self.secondaryTextAlignment ?? .left
    secondaryLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
    //secondaryLabel.text = secondaryText
      
      secondaryLabel.text =   NSLocalizedString(secondaryText, comment: "")

    secondaryLabel.numberOfLines = 0
    
    secondaryLabel.frame = CGRect(x: 0,
                                  y: primaryLabel.frame.height + secondaryTextTopPadding ,
                                  width: frame.width,
                                  height: 0)
    secondaryLabel.sizeToFitHeight()
    addSubview(secondaryLabel)
    frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: primaryLabel.frame.height + secondaryLabel.frame.height)
  }
  
    /// Configures and adds secondary label view
    private func addThirdLabel() {
      if thirdLabel != nil {
          thirdLabel.removeFromSuperview()
      }
      
      thirdLabel = UILabel()
      
        if let font = secondaryTextFont {
          thirdLabel.font = font
      } else {
          thirdLabel.font = UIFont.systemFont(ofSize: 12)
      }
        thirdLabel.textColor = secondaryTextColor
        thirdLabel.textAlignment = self.secondaryTextAlignment ?? .left
        thirdLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        //thirdLabel.attributedText = thirdAttributedText
        
        if let thirdAttributedText = thirdAttributedText {
            thirdLabel.attributedText = thirdAttributedText
        } else {
            thirdLabel.text=""
        }
        
//        thirdLabel.paddingLeft = 15
//        thirdLabel.paddingRight = 15
//        thirdLabel.paddingTop = 8
//        thirdLabel.paddingBottom = 8
        
        // label 5
        thirdLabel.layer.cornerRadius = 8
        thirdLabel.layer.masksToBounds = true
        thirdLabel.layer.borderWidth = 1.0
        thirdLabel.layer.borderColor = UIColor.white.cgColor
        
        
         
        //thirdLabel.text = secondaryText
        thirdLabel.numberOfLines = 2
        
        
        
      
        thirdLabel.frame = CGRect(x: 0,
                                  y: primaryLabel.frame.height + secondaryTextTopPadding + secondaryLabel.frame.height + 8,
                                    width: frame.width,
                                    height: 0)
        
        thirdLabel.sizeToFitHeight()
        
        addSubview(thirdLabel)
        
        frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: primaryLabel.frame.height + secondaryLabel.frame.height + thirdLabel.frame.height)
    }
  
  /// Overrides this to add subviews. They will be drawn when calling show()
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    addPrimaryLabel()
    addSecondaryLabel()
    addThirdLabel()
    
    subviews.forEach({$0.isUserInteractionEnabled = false})
  }
}
