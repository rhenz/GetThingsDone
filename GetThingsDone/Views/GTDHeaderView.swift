//
//  GTDHeaderView.swift
//  GetThingsDone
//
//  Created by John Salvador on 9/24/22.
//

import UIKit

protocol GTDHeaderViewDelegate: AnyObject {
    func gtdHeaderView(_ gtdHeaderView: GTDHeaderView, didTapAddButton button: UIButton)
}

protocol GTDHeaderViewDatasource: AnyObject {
    func gtdHeaderView(_ gtdHeaderView: GTDHeaderView, subtitleForLabel label: GTDLabel) -> String
}

final class GTDHeaderView: UIView {
    
    // MARK: - Views
    private let gradientView = GTDGradientView()
    private let titleLabel = GTDLabel()
    private let subtitleLabel = GTDLabel()
    
    private(set) lazy var addButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .white
        configuration.image = UIImage(systemName: "plus.app.fill")
        
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Properties
    weak var delegate: GTDHeaderViewDelegate?
    weak var datasource: GTDHeaderViewDatasource? {
        didSet { updateSubtitle() }
    }
    
    let headerTitle: String
    var subtitle = ""
    
    // MARK: - Init
    init(frame: CGRect = .zero, headerTitle: String) {
        self.headerTitle = headerTitle
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI
extension GTDHeaderView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(gradientView)
        
        titleLabel.text = headerTitle
        addSubview(titleLabel)
        
        subtitleLabel.text = subtitle
        subtitleLabel.font = subtitleLabel.font.withSize(Styles.FontSize.largeTitle)
        addSubview(subtitleLabel)
        
        addSubview(addButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 10
        let sidePadding: CGFloat = 20
        let subtitleWidth: CGFloat = 250
        let subtitleHeight: CGFloat = 25
        let titleAndSubtitlePadding: CGFloat = 4
        
        // Main
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Title
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -titleAndSubtitlePadding),
            titleLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor)
        ])
        
        // Subtitle
        NSLayoutConstraint.activate([
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding),
            subtitleLabel.widthAnchor.constraint(equalToConstant: subtitleWidth),
            subtitleLabel.heightAnchor.constraint(equalToConstant: subtitleHeight)
        ])
        
        // Add Button
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding)
        ])
    }
}

// MARK: - Actions
extension GTDHeaderView {
    @objc private func addButtonPressed(_ sender: UIButton) {
        delegate?.gtdHeaderView(self, didTapAddButton: sender)
    }
}

// MARK: - Datasource
extension GTDHeaderView {
    func updateSubtitle() {
        subtitleLabel.text = datasource?.gtdHeaderView(self, subtitleForLabel: subtitleLabel)
    }
}
