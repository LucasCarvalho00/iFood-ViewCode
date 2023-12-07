//
//  Extension+UIView.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.topAnchor
    }
    
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.leadingAnchor
    }
     
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.trailingAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.bottomAnchor
    }

    
    /// Constraints to its superview
    ///
    /// - Parameters:
    ///   - top: Top constant. Default value is 0.
    ///   - leading: Leading constant. Default value is 0.
    ///   - trailing: Trailing constant. Default value is 0.
    ///   - bottom: Bottom constant. Default value is 0.
    func constraintToSuperview(top: CGFloat = 0,
                                     leading: CGFloat = 0,
                                     trailing: CGFloat = 0,
                                     bottom: CGFloat = 0,
                                     bottomPriority: UILayoutPriority = .required) {
       
       guard let superview = self.superview else {
           return
       }
       let bottomConstraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom)

       let constraints = [
           topAnchor.constraint(equalTo: superview.topAnchor, constant: top),
           trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing),
           leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading),
           bottomConstraint
       ]

       bottomConstraint.priority = bottomPriority
       NSLayoutConstraint.activate(constraints)
    }

    /// Constraints to its safeArea
    ///
    /// - Parameters:
    ///   - top: Top constant. Default value is 0.
    ///   - leading: Leading constant. Default value is 0.
    ///   - trailing: Trailing constant. Default value is 0.
    ///   - bottom: Bottom constant. Default value is 0.
    func constraintToSafeArea(top: CGFloat = 0,
                                     leading: CGFloat = 0,
                                     trailing: CGFloat = 0,
                                     bottom: CGFloat = 0,
                                     bottomPriority: UILayoutPriority = .required) {
       guard let superview = self.superview else {
           return
       }
       let bottomConstraint = bottomAnchor.constraint(equalTo: superview.safeBottomAnchor, constant: bottom)

       let constraints = [
            topAnchor.constraint(equalTo: superview.safeTopAnchor, constant: top),
            trailingAnchor.constraint(equalTo: superview.safeTrailingAnchor, constant: trailing),
            leadingAnchor.constraint(equalTo: superview.safeLeadingAnchor, constant: leading),
           bottomConstraint
       ]

       bottomConstraint.priority = bottomPriority
       NSLayoutConstraint.activate(constraints)
    }
}
