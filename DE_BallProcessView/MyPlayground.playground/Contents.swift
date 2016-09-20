//: Playground - noun: a place where people can play

import UIKit

class PPView : UIView {
    var numberOfScaler: Int = 180
    var lengthOfScaler: CGFloat = 10
    var widthOfScaler: CGFloat = 2

    init(origin: CGPoint, width: CGFloat) {
        super.init(frame: CGRect(origin: origin, size: CGSize(width: width, height: width)))
        backgroundColor = UIColor.clear
    }

    @available(*, unavailable) override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable) init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        self.drawScale(context)
    }

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


//let view = PPView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
let view = PPView(origin: CGPoint(x: 0, y: 0), width: 300)
view.backgroundColor = UIColor.orange

