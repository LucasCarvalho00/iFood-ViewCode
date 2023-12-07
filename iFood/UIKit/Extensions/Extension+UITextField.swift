//
//  Extension+UIImageView.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

extension UITextField {
  func setLeftView(image: UIImage) {
      let iconView = UIImageView(
        frame: CGRect(x: IFMetrics.mediumMargin, y: IFMetrics.mediumMargin, width: 20, height: 25))
    iconView.image = image
      iconView.contentMode = .scaleAspectFit
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
    self.tintColor = .lightGray
  }
}
