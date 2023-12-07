//
//  SearchTextField.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

class SearchTextField: UITextField {
    
    // MARK: - Constants
    
    struct Constants {
        static let defaultPlaceholder: String = NSLocalizedString("Pesquisar", comment: "")
    }
    
    struct Metrics {
        static let borderWidth: CGFloat = 1.0
        static let cornerRadius: CGFloat = 6.0
        static let imageSize: CGFloat = 24.0
    }
    
    // MARK: - Attributes

    override var placeholder: String? {
        didSet {
            guard let placeholder = placeholder else { return }
            let placeHolderColorAttr = [NSAttributedString.Key.foregroundColor : UIColor.lightGrey]
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeHolderColorAttr)
        }
    }
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func setup() {
        clearButtonMode = .always
        backgroundColor = .solitude
        textColor = .darkGray
        placeholder = Constants.defaultPlaceholder
        layer.borderWidth = Metrics.borderWidth
        layer.borderColor = UIColor.lightGrey.cgColor
            
        layer.masksToBounds = true
        layer.cornerRadius = Metrics.cornerRadius
        
        setLeftView(image: .magnifyingGlassIcon)
    }
}
