//
//  PaddingLabel.swift
//  MaterialShowcase
//
//  Created by Subash Aryal on 2023-08-03.
//  Copyright © 2023 Aromajoin. All rights reserved.
//

import Foundation
import UIKit
import UIKit
  
@IBDesignable public class PaddedAndBorderedLabel: UILabel {

      @IBInspectable var topInset: CGFloat = 5.0
      @IBInspectable var bottomInset: CGFloat = 5.0
      @IBInspectable var leftInset: CGFloat = 7.0
      @IBInspectable var rightInset: CGFloat = 7.0
      @IBInspectable var borderColor : UIColor = UIColor.white
      @IBInspectable var borderWidth : CGFloat = 1
      @IBInspectable var cornerRadius : CGFloat = 5
      
//      override func drawText(in rect: CGRect) {
//          let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
//          super.drawText(in: rect.inset(by: insets))
//      }
//
//
//      override var intrinsicContentSize: CGSize {
//          let size = super.intrinsicContentSize
//          return CGSize(width: size.width + leftInset + rightInset,
//                height: size.height + topInset + bottomInset)
//      }
//
//      override func textRect(forBounds bounds:CGRect,
//                         limitedToNumberOfLines n:Int) -> CGRect {
//          let b = bounds
//          let UIEI = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
//          let tr = b.inset(by: UIEI)
//          let ctr = super.textRect(forBounds: tr, limitedToNumberOfLines: 0)
//          // that line of code MUST be LAST in this function, NOT first
//          return ctr
//      }
//
//      override func draw(_ rect: CGRect) {
//          layer.borderColor = borderColor.cgColor
//          layer.borderWidth = borderWidth
//          layer.cornerRadius = cornerRadius
//          layer.masksToBounds = true
//          super.draw(rect)
//      }
//
    
    let UIEI = UIEdgeInsets(top: 60, left: 20, bottom: 20, right: 24) // as desired

    override var intrinsicContentSize:CGSize {
        numberOfLines = 0       // don't forget!
        var s = super.intrinsicContentSize
        s.height = s.height + UIEI.top + UIEI.bottom
        s.width = s.width + UIEI.left + UIEI.right
        return s
    }

    override func drawText(in rect:CGRect) {
        let r = rect.inset(by: UIEI)
        super.drawText(in: r)
    }

    override func textRect(forBounds bounds:CGRect,
                               limitedToNumberOfLines n:Int) -> CGRect {
        let b = bounds
        let tr = b.inset(by: UIEI)
        let ctr = super.textRect(forBounds: tr, limitedToNumberOfLines: 0)
        // that line of code MUST be LAST in this function, NOT first
        return ctr
    }

    
  }
