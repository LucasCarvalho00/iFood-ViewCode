//
//  DetailView.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation
import UIKit

final class DetailView: UIView {

    // MARK: - Constants
    
    private struct Metrics {
        static let widthImage: CGFloat = 150.0
        static let heightImage: CGFloat = 220.0
    }
    
    private struct Constants {
        static let nameText: String = NSLocalizedString("Nome", comment: "")
        static let genreText: String = NSLocalizedString("Gênero", comment: "")
        static let dateText: String = NSLocalizedString("Data de Lançamento", comment: "")
        static let overViewText: String = NSLocalizedString("Visão Geral", comment: "")
    }
    
    // MARK: - Delegates
    
    weak var delegate: DetailViewViewControllerProtocol?

    // MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()

    private lazy var imageFilm: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.nameText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.genreText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.dateText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.overViewText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentTitleNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentGenreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentOverviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func constraintUI() {
        addSubview(scrollView)
        scrollView.addSubview(imageFilm)
        scrollView.addSubview(titleNameLabel)
        scrollView.addSubview(genreLabel)
        scrollView.addSubview(dataLabel)
        scrollView.addSubview(overviewLabel)
        scrollView.addSubview(contentTitleNameLabel)
        scrollView.addSubview(contentGenreLabel)
        scrollView.addSubview(contentDataLabel)
        scrollView.addSubview(contentOverviewLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageFilm.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: IFMetrics.xlMargin),
            imageFilm.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageFilm.heightAnchor.constraint(equalToConstant: Metrics.heightImage),
            imageFilm.widthAnchor.constraint(equalToConstant: Metrics.widthImage),
            
            titleNameLabel.topAnchor.constraint(equalTo: imageFilm.bottomAnchor, constant: IFMetrics.xlMargin),
            titleNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            titleNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin),
            
            contentTitleNameLabel.topAnchor.constraint(equalTo: titleNameLabel.bottomAnchor, constant: IFMetrics.tinyMargin),
            contentTitleNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            contentTitleNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin),
            
            genreLabel.topAnchor.constraint(equalTo: contentTitleNameLabel.bottomAnchor, constant: IFMetrics.xlMargin),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.tinyMargin),
            
            contentGenreLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: IFMetrics.tinyMargin),
            contentGenreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            contentGenreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: IFMetrics.xlMargin),
            
            dataLabel.topAnchor.constraint(equalTo: contentGenreLabel.bottomAnchor, constant: IFMetrics.xlMargin),
            dataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            dataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin),
            
            contentDataLabel.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: IFMetrics.tinyMargin),
            contentDataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            contentDataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin),
            
            overviewLabel.topAnchor.constraint(equalTo: contentDataLabel.bottomAnchor, constant: IFMetrics.xlMargin),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin),
            
            contentOverviewLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: IFMetrics.tinyMargin),
            contentOverviewLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -IFMetrics.xlMargin),
            contentOverviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            contentOverviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin)
        ])
    }
    
    // MARK: - Private Functions
    
    private func setDataView(data: TopRatedMovieList) {
        contentTitleNameLabel.text = data.title
        contentGenreLabel.text = data.genreIds.description
        contentDataLabel.text = data.releaseDate
        contentOverviewLabel.text = data.overview
        setImage(data: data)
    }
    
    private func setImage(data: TopRatedMovieList) {
        if let urlPhoto = URL(string: data.posterPath) {
            let session = URLSession.shared
            let task = session.dataTask(with: urlPhoto) { [weak imageFilm] data, response, error in
                guard let data = data else {
                    return
                }
                
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    imageFilm?.image = image
                }
            }
        
            task.resume()
        }
    }
}

// MARK: - Extensions

extension DetailView: DetailViewProtocol {
    func setupUI(state: DetailState) {
        switch state {
        case let .hasData(data):
            setDataView(data: data)
        }
    }
}
