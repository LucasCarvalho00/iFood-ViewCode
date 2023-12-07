//
//  ListDataViewCell.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation
import UIKit

final class ListDataViewCell: UITableViewCell {
    
    // MARK: - Private Attributes

    private var task: URLSessionDataTask?

    // MARK: - Constants

    private struct Metrics {
        static let arrowSize: CGFloat = 24.0
        static let widthImage: CGFloat = 70.0
        static let heightImage: CGFloat = 100.0
    }
    
    private struct Constants {
        static let genreText: String = NSLocalizedString("Gênero", comment: "")
        static let dateText: String = NSLocalizedString("Data de Lançamento", comment: "")
    }
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primary
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreContent: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateContent: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageFilm: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .darkGray
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageArrow: UIImageView = {
        let image = UIImageView()
        image.image = .chevronRight
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    // MARK: - Initializers
    
    private override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle

    override func prepareForReuse() {
        super.prepareForReuse()
        task?.cancel()
        task = nil
        imageFilm.image = nil
    }
    
    // MARK: - Setup

    private func setupCell() {
        contentView.backgroundColor = .white
        selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
    private func constraintUI() {
        contentView.addSubview(imageFilm)
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreTitle)
        contentView.addSubview(genreContent)
        contentView.addSubview(dateTitle)
        contentView.addSubview(dateContent)
        contentView.addSubview(imageArrow)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageFilm.topAnchor.constraint(equalTo: contentView.topAnchor, constant: IFMetrics.smallMargin),
            imageFilm.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -IFMetrics.smallMargin),            imageFilm.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: IFMetrics.smallMargin),
            imageFilm.heightAnchor.constraint(equalToConstant: Metrics.heightImage),
            imageFilm.widthAnchor.constraint(equalToConstant: Metrics.widthImage),

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: IFMetrics.smallMargin),
            titleLabel.leadingAnchor.constraint(equalTo: imageFilm.trailingAnchor, constant: IFMetrics.smallMargin),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin),
            
            imageArrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageArrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -IFMetrics.smallMargin),
            imageArrow.heightAnchor.constraint(equalToConstant: Metrics.arrowSize),
            imageArrow.widthAnchor.constraint(equalToConstant: Metrics.arrowSize),

            genreTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: IFMetrics.smallMargin),
            genreTitle.leadingAnchor.constraint(equalTo: imageFilm.trailingAnchor, constant: IFMetrics.smallMargin),

            genreContent.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: IFMetrics.smallMargin),
            genreContent.leadingAnchor.constraint(equalTo: genreTitle.trailingAnchor, constant: IFMetrics.smallMargin),
            genreContent.trailingAnchor.constraint(equalTo: imageArrow.leadingAnchor, constant: -IFMetrics.smallMargin),

            dateTitle.topAnchor.constraint(equalTo: genreContent.bottomAnchor, constant: IFMetrics.smallMargin),
            dateTitle.leadingAnchor.constraint(equalTo: imageFilm.trailingAnchor, constant: IFMetrics.smallMargin),

            dateContent.topAnchor.constraint(equalTo: genreContent.bottomAnchor, constant: IFMetrics.smallMargin),
            dateContent.leadingAnchor.constraint(equalTo: dateTitle.trailingAnchor, constant: IFMetrics.smallMargin),
            ])
    }
    
    // MARK: - Public Functions

    public func setupUI(data: TopRatedMovieList) {
        titleLabel.text = data.title
        genreTitle.text = Constants.genreText
        dateTitle.text = Constants.dateText
        dateContent.text = String.toDate(data.releaseDate)
        genreContent.text = data.genreIds.description
        setImage(photoURL: data.posterPath)
    }

    // MARK: - Private Functions

    private func setImage(photoURL: String) {
        if let urlPhoto = URL(string: photoURL) {
            let session = URLSession.shared
            task = session.dataTask(with: urlPhoto) { [weak imageFilm] data, response, error in
                guard let data = data else {
                    return
                }
                
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    imageFilm?.image = image
                }
            }
        
            task?.resume()
        }
    }
}

