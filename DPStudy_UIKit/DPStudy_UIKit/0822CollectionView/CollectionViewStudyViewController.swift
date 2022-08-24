//
//  CollectionViewStudyViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/08/22.
//

import UIKit
import SnapKit

class CollectionViewStudyViewController: UIViewController {
    
    var colors: [UIColor] = [.systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemTeal, .systemPink, .systemFill, .systemBrown, .systemGray2, .systemGreen, .systemIndigo, .systemOrange, .systemIndigo, .systemBackground, .systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemTeal, .systemPink, .systemFill, .systemBrown, .systemGray2, .systemGreen, .systemIndigo, .systemOrange, .systemIndigo, .systemBackground]
    let flowLayout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addGesture()
    }
    
    func addGesture() {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(_:)))
        collectionView.addGestureRecognizer(gesture)
    }
    @objc
    func didLongPress(_ sender: UILongPressGestureRecognizer) {
        let location = sender.location(in: collectionView)
        print(location)
        switch sender.state {
        case .began:
            print("began")
            guard let indexPath = collectionView.indexPathForItem(at: location) else { return }
            print(indexPath)
            collectionView.beginInteractiveMovementForItem(at: indexPath)
        case .changed:
            print("changed")
            collectionView.updateInteractiveMovementTargetPosition(location)
        case .ended:
            print("cancelled")
            collectionView.endInteractiveMovement()
        case .cancelled:
            print("cancelled")
            collectionView.cancelInteractiveMovement()
        default :
            print("default")
        }
    }
}
extension CollectionViewStudyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let color = colors.remove(at: sourceIndexPath.item)
        colors.insert(color, at: destinationIndexPath.item)
    }
}

extension CollectionViewStudyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError() }
        cell.backgroundColor = colors[indexPath.item]
        cell.label.text = "\(indexPath)"
        return cell
    }
}

// MARK: - UI
extension CollectionViewStudyViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        flowLayout.itemSize = CGSize(width: view.frame.width / 3.3, height: view.frame.height / 4)
        flowLayout.minimumInteritemSpacing = 10 // 아이템 간 가로 거리
        flowLayout.minimumLineSpacing = 20 // 아이템 간 세로 거리
        flowLayout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        //        flowLayout.scrollDirection = .horizontal // 스크롤 방향
    }
    final private func setLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
