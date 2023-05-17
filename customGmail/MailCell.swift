//
//  MailCell.swift
//  customGmail
//
//  Created by Edgar Grigoryan on 17.05.23.
//

import UIKit
import PureLayout

class MailCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "person"))
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing

        stackView.addArrangedSubview(self.titleLabel)
        stackView.addArrangedSubview(self.subtitleLabel)
        stackView.addArrangedSubview(self.descriptionLabel)
        
        return stackView
    }()
    
    private func setupImageView() {
        let imageViewSize = CGSize(width: self.bounds.height, height: self.bounds.height)
        self.contentView.add(self.imageView) { imageView in
            imageView.configureForAutoLayout()
            imageView.autoPinEdge(toSuperviewEdge: .leading)
            imageView.autoAlignAxis(toSuperviewAxis: .horizontal)
            imageView.autoSetDimensions(to: imageViewSize)
        }
        imageView.layer.cornerRadius = imageViewSize.width / 2
    }
    
    private func setupLabelsStackView() {
        self.contentView.add(self.labelsStackView) { stackview in
            stackview.configureForAutoLayout()
            stackview.autoPinEdge(.leading, to: .trailing, of: self.imageView, withOffset: 10)
            stackview.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .leading)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
 
    
    private func commonInit() {
        self.setupImageView()
        self.setupLabelsStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with mail: Mail) {
        self.imageView.image = mail.image
        self.titleLabel.text = mail.title
        self.subtitleLabel.text = mail.subtitle
        self.descriptionLabel.text = mail.description
    }
}
