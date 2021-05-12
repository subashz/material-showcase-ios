//
//  MaterialShowcaseController.swift
//  MaterialShowcase
//
//  Created by Andrei Tulai on 2017-11-06.
//  Copyright © 2017 Aromajoin. All rights reserved.
//

import Foundation

public protocol MaterialShowcaseControllerDelegate: class {
  
  func materialShowcaseController(_ materialShowcaseController: MaterialShowcaseController,
                                  materialShowcaseWillDisappear materialShowcase: MaterialShowcase,
                                  forIndex index: Int)
  func materialShowcaseController(_ materialShowcaseController: MaterialShowcaseController,
                                  materialShowcaseDidDisappear materialShowcase: MaterialShowcase,
                                  forIndex index: Int)
  
}

public extension MaterialShowcaseControllerDelegate {
  func materialShowcaseController(_ materialShowcaseController: MaterialShowcaseController,
                                  materialShowcaseWillDisappear materialShowcase: MaterialShowcase,
                                  forIndex index: Int) {
    // do nothing
  }
  
  func materialShowcaseController(_ materialShowcaseController: MaterialShowcaseController,
                                  materialShowcaseDidDisappear materialShowcase: MaterialShowcase,
                                  forIndex index: Int) {
    // do nothing
  }
}

public protocol MaterialShowcaseControllerDataSource: class {
  func numberOfShowcases(for materialShowcaseController: MaterialShowcaseController) -> Int
  
  func materialShowcaseController(_ materialShowcaseController: MaterialShowcaseController,
                                  showcaseAt index: Int) -> MaterialShowcase?
  
}

open class MaterialShowcaseController {
  public weak var dataSource: MaterialShowcaseControllerDataSource?
  public weak var delegate: MaterialShowcaseControllerDelegate?
  
  public var started = false
  public var currentIndex = -1
  public weak var currentShowcase: MaterialShowcase?
  
  public init() {
    
  }
  
  open func start() {
    started = true
    nextShowcase()
  }
  
  open func stop() {
    started = false
    currentIndex = -1
    currentShowcase?.completeShowcase(animated: true)
  }
  
  open func nextShowcase() {
    if let currentShowcase = self.currentShowcase {
      currentShowcase.completeShowcase(animated: true)
      self.currentShowcase = nil
    }
    let numberOfShowcases = dataSource?.numberOfShowcases(for: self) ?? 0
    currentIndex += 1
    let showcase = dataSource?.materialShowcaseController(self, showcaseAt: currentIndex)
    showcase?.onWillDissmiss = { [weak self] showcase, _ in
        guard let self = self else { return }
        self.delegate?.materialShowcaseController(self, materialShowcaseWillDisappear: showcase, forIndex: self.currentIndex)
    }
    showcase?.onDidDissmiss = { [weak self] showcase, _ in
        guard let self = self else { return }
        self.delegate?.materialShowcaseController(self, materialShowcaseDidDisappear: showcase, forIndex: self.currentIndex)
        self.currentShowcase = nil
        if self.started {
          self.nextShowcase()
        }
    }
    guard currentIndex < numberOfShowcases else {
      started = false
      currentIndex = -1
      return
    }
    currentShowcase = showcase
    showcase?.show(completion: nil)
  }
}
