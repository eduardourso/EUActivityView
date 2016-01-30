//
//  EUActivityIndicatorShape.swift
//  Pods
//
//  Created by EduardoUrso on 1/28/16.
//
//

import UIKit

enum EUActivityIndicatorShape {
    
    case Circle
    case Line
    
    func createLayerWith(size size: CGSize, color: UIColor) -> CALayer {
        let layer: CAShapeLayer = CAShapeLayer()
        var path: UIBezierPath = UIBezierPath()
        
        switch self {
        case .Circle:
            path.addArcWithCenter(CGPoint(x: size.width / 2, y: size.height / 2),
                radius: size.width / 2,
                startAngle: 0,
                endAngle: CGFloat(2 * M_PI),
                clockwise: false);
            layer.fillColor = color.CGColor
            
            case .Line:
                path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height),
                    cornerRadius: size.width / 2)
                layer.fillColor = color.CGColor
        }
        
        layer.backgroundColor = nil
        layer.path = path.CGPath
        
        return layer
    }
}