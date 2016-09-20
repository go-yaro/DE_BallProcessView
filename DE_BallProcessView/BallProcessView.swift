//
//  BallProcessView.swift
//  DE_BallProcessView
//
//  Created by go.yaro on 9/20/16.
//  Copyright © 2016 Roro Studio. All rights reserved.
//

import UIKit

class BallProcessView : UIView {
    var numberOfScaler: Int = 180
    var lengthOfScaler: CGFloat = 10
    var widthOfScaler: CGFloat = 2

    let frontWaveColor = UIColor(red: 0.325, green: 0.392, blue: 0.729, alpha: 1)
    let endWaveColor = UIColor(red: 0.322, green: 0.514, blue: 0.831, alpha: 1)
    let waterBGColor = UIColor(red: 0.259, green: 0.329, blue: 0.506, alpha: 1)

    init(origin: CGPoint, width: CGFloat) {
        super.init(frame: CGRect(origin: origin, size: CGSize(width: width, height: width)))
    }

    @available(*, unavailable) override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable) init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        drawWave(context)
        drawScale(context)
    }

    /**
     Draw Wave
     - parameter context: CGContext to draw on
     - returns: void
     */
    private func drawWave(_ context: CGContext?) {
        guard context != nil else {
            return
        }
        var frontWave = CGMutablePath()
        var endWave = CGMutablePath()

        // Draw front wave
        context?.setLineWidth(1)
        context?.setFillColor(frontWaveColor.cgColor)

        var offset = 10
    }

    /**
     Draw Circle Meter
     - parameter context: CGContext to draw on
     - returns: void
     */
    private func drawScale(_ context: CGContext?) {
        guard context != nil else {
            return
        }
        context!.setLineWidth(widthOfScaler)
        context!.translateBy(x: frame.width/2, y: frame.width/2)
        context!.setStrokeColor(UIColor.white.cgColor)

        for _ in 0..<numberOfScaler {
            context?.moveTo(x: frame.width/2 - lengthOfScaler, y: 0)
            context?.addLineTo(x: frame.width/2, y: 0)
            context?.strokePath()
            context?.rotate(by: CGFloat(2*M_PI / Double(numberOfScaler)))
        }

        context?.setStrokeColor(UIColor.white.cgColor)
        context?.setLineWidth(0.5)
        context?.addArc(centerX: 0, y: 0, radius: frame.width/2 - lengthOfScaler - 5, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: 0)
        context?.strokePath()
        context?.translateBy(x: -frame.width/2, y: -frame.width/2)
    }
}
