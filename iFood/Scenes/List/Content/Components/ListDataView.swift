//
//  ListDataView.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import Foundation
import UIKit

final class ListDataView: UIView {
    
    // MARK: - Private Attributes

    private var item: [TopRatedMovieList] = []
    private var filteredFilms: [TopRatedMovieList] = []

    // MARK: - Constants
    
    private struct Metrics {
        static let minimumHeightCell: CGFloat = 0.01
        static let lineSeparatorViewHeight: CGFloat = 30.0
        static let searchTextFieldHeight: CGFloat = 40.0
        static let cellHeight: CGFloat = 200.0
    }
    
    private struct Constants {
        static let separatorTitle = NSLocalizedString("Listagem de Filmes", comment: "")
    }
    
    // MARK: - Delegates
    
    weak var delegate: ListDataViewDelegate?
    
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
        
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var searchTextField: SearchTextField = {
        let textField = SearchTextField()
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()

    private lazy var itemsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListDataViewCell.self, forCellReuseIdentifier: ListDataViewCell.className)
        tableView.showsHorizontalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .solitude
        return tableView
    }()
    
    private lazy var lineSeparatorView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .solitude
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var separatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = Constants.separatorTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Actions
    
    @objc private func textFieldDidChange(textField: UITextField) {
        guard !(textField.text?.isEmpty ?? true) else {
            filteredFilms = item
            itemsTableView.reloadData()
            return
        }
        
        let searchText = textField.text!.lowercased()
        let filtered = item.filter { $0.title.lowercased().contains(searchText) }
        filteredFilms = filtered
        itemsTableView.reloadData()
    }
    
    // MARK: - Setup
    
    private func constraintUI() {
        addSubview(searchTextField)
        addSubview(lineSeparatorView)
        addSubview(itemsTableView)
        lineSeparatorView.addSubview(separatorLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: IFMetrics.xxlMargin),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.xlMargin),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -IFMetrics.xlMargin),
            searchTextField.heightAnchor.constraint(equalToConstant: Metrics.searchTextFieldHeight),
            
            lineSeparatorView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: IFMetrics.xxlMargin),
            lineSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            separatorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: IFMetrics.smallMargin),
            separatorLabel.topAnchor.constraint(equalTo: lineSeparatorView.topAnchor, constant: IFMetrics.smallMargin),
            separatorLabel.bottomAnchor.constraint(equalTo: lineSeparatorView.bottomAnchor, constant: -IFMetrics.smallMargin),
            
            itemsTableView.topAnchor.constraint(equalTo: separatorLabel.bottomAnchor),
            itemsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemsTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    // MARK: - Internal Functions
    
    func setupUI(data: TopRatedMovies) {
        self.item = data.results
        self.filteredFilms = data.results
        itemsTableView.reloadData()
    }
}

// MARK: - Extensions

extension ListDataView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didTapToMovie(data: filteredFilms[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ListDataView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.filteredFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListDataViewCell.className,
                                                       for: indexPath) as? ListDataViewCell else {
            return UITableViewCell()
        }
        cell.setupUI(data: filteredFilms[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: itemsTableView.frame.size.width, height: Metrics.minimumHeightCell))
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: itemsTableView.frame.size.width, height: Metrics.minimumHeightCell))
    }
}

extension ListDataView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        endEditing(true)
       return true
    }
}
