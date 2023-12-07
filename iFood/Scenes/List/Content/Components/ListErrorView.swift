//
//  ListErrorView.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation
import UIKit

final class ListErrorView: UIView {
    
    // MARK: - Constants
    
    private struct Metrics {
        static let borderWidth: CGFloat = 1.0
        static let bottonWidth: CGFloat = 130.0
        static let imageHeight: CGFloat = 200.0
    }
    
    private struct Constants {
        static let titleText: String = NSLocalizedString("Recarregar informações", comment: "")
        static let contentText: String = NSLocalizedString("No momento não foi possível mostrar as informações. Que tal tentar novamente?", comment: "")
        static let buttonText: String = NSLocalizedString("RECARREGAR", comment: "")
    }
    
    // MARK: - Delegates
    
    weak var delegate: ListErrorViewDelegate?
    
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var alertImage: UIImageView = {
        let image = UIImageView()
        image.image = .imageAlert
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = Constants.titleText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cotentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Constants.contentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.buttonText, for: .normal)
        button.setTitleColor(.primary ,for: .normal)
        button.layer.borderColor = UIColor.secondary.cgColor
        button.layer.borderWidth = Metrics.borderWidth
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapReload), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    
    @objc private func didTapReload() {
        delegate?.didTapReload()
    }
    
    // MARK: - Setup
    
    private func constraintUI() {
        addSubview(alertImage)
        addSubview(titleLabel)
        addSubview(cotentLabel)
        addSubview(reloadButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            alertImage.topAnchor.constraint(equalTo: topAnchor, constant: IFMetrics.xxlMargin),
            alertImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertImage.heightAnchor.constraint(equalToConstant: Metrics.imageHeight),

            titleLabel.topAnchor.constraint(equalTo: alertImage.bottomAnchor, constant: IFMetrics.xxlMargin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin),
            
            cotentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: IFMetrics.xlMargin),
            cotentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            cotentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin),
            
            reloadButton.topAnchor.constraint(equalTo: cotentLabel.bottomAnchor, constant: IFMetrics.xxlMargin),
            reloadButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            reloadButton.widthAnchor.constraint(equalToConstant: Metrics.bottonWidth)
        ])
    }
    
    // MARK: - Internal Functions
    
    func setupUI(message: String) {
        cotentLabel.text = message
    }
}

