//
//  DisplayLinkProxy.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 9/30/20.
//
//

import Foundation
import UIKit

public class DisplayLinkProxy {
    public typealias DisplayLinkHandler = ((CADisplayLink) -> Void)
    public private(set) var displaylink: CADisplayLink?
    public var handler: DisplayLinkHandler?
    
    public init(handler: DisplayLinkHandler? = nil) {
        self.handler = handler
        displaylink = CADisplayLink(target: self, selector: #selector(onDisplayUpdate(_:)))
        displaylink?.add(to: RunLoop.current, forMode: .common)
    }

    @objc func onDisplayUpdate(_ sender: CADisplayLink) {
        handler?(sender)
    }

    public func pause() {
        displaylink?.isPaused = true
    }
    
    public func resume() {
        displaylink?.isPaused = false
    }
    
    public func invalidate() {
        displaylink?.remove(from: RunLoop.current, forMode: .common)
        displaylink?.invalidate()
        displaylink = nil
    }
}
