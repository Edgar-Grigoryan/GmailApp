//
//  MailsViewController.swift
//  customGmail
//
//  Created by Edgar Grigoryan on 17.05.23.
//

import UIKit
import PureLayout

class MailsViewController: UIViewController {
    private let cellHeight: CGFloat = 70

    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = 20

        return collectionViewFlowLayout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.collectionViewFlowLayout)
        collectionView.register(MailCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()
    
    private let data: [Mail] = [
        Mail(image: UIImage(named: "person")!, title: "Title 1", subtitle: "Subtitile 1 Lorem ipsum dolor sit a met amas k", description: "Description 1 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 2", subtitle: "Subtitile 2 Lorem ipsum dolor sit a met amas k", description: "Description 2 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 3", subtitle: "Subtitile 3 Lorem ipsum dolor sit a met amas k", description: "Description 3 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 4", subtitle: "Subtitile 4 Lorem ipsum dolor sit a met amas k", description: "Description 4 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 5", subtitle: "Subtitile 5 Lorem ipsum dolor sit a met amas k", description: "Description 5 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 6", subtitle: "Subtitile 6 Lorem ipsum dolor sit a met amas k", description: "Description 6 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 7", subtitle: "Subtitile 7 Lorem ipsum dolor sit a met amas k", description: "Description 7 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 8", subtitle: "Subtitile 8 Lorem ipsum dolor sit a met amas k", description: "Description 8 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 9", subtitle: "Subtitile 9 Lorem ipsum dolor sit a met amas k", description: "Description 9 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 10", subtitle: "Subtitile 10 Lorem ipsum dolor sit a met amas k", description: "Description 10 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 11", subtitle: "Subtitile 11 Lorem ipsum dolor sit a met amas k", description: "Description 11 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 12", subtitle: "Subtitile 12 Lorem ipsum dolor sit a met amas k", description: "Description 12 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 13", subtitle: "Subtitile 13 Lorem ipsum dolor sit a met amas k", description: "Description 13 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 14", subtitle: "Subtitile 14 Lorem ipsum dolor sit a met amas k", description: "Description 14 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 15", subtitle: "Subtitile 15 Lorem ipsum dolor sit a met amas k", description: "Description 15 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 16", subtitle: "Subtitile 16 Lorem ipsum dolor sit a met amas k", description: "Description 16 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 17", subtitle: "Subtitile 17 Lorem ipsum dolor sit a met amas k", description: "Description 17 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 19", subtitle: "Subtitile 18 Lorem ipsum dolor sit a met amas k", description: "Description 18 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 20", subtitle: "Subtitile 19 Lorem ipsum dolor sit a met amas k", description: "Description 19 Lorem ipsum dolor sit a met amas k"),
        Mail(image: UIImage(named: "person")!, title: "Title 21", subtitle: "Subtitile 20 Lorem ipsum dolor sit a met amas k", description: "Description 20 Lorem ipsum dolor sit a met amas k"),
    ]
    
    private func setupCollectionView() {
        self.view.add(self.collectionView) { collectionView in
            collectionView.configureForAutoLayout()
            collectionView.autoPinEdgesToSuperviewSafeArea()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.collectionViewFlowLayout.invalidateLayout()
    }
}

extension MailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO
    }
}

extension MailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = (collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        return CGSize(width: collectionView.frame.width - inset.left - inset.right, height: cellHeight)
    }
}

extension MailsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MailCell
        cell.configure(with: self.data[indexPath.row])

        return cell
    }
}
