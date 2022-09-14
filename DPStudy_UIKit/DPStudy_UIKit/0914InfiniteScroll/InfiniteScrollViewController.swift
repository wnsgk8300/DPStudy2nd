//
//  InfiniteScrollViewController.swift
//  DPStudy_UIKit
//
//  Created by JEON JUNHA on 2022/09/14.
//

import UIKit

class InfiniteScrollViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let colors: [UIColor] = [ .blue, .red, .orange, .yellow, .green, .blue, .red, .orange]
//    private let colors: [UIColor] = [ .blue]
    private var cellWidth: CGFloat = 0
    override func viewDidLoad() {
        setUI()
        view.backgroundColor = .systemBackground
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        collectionView.snp.updateConstraints { make in
//            make.height.equalTo(collectionView.frame.width)
//        }
        setFlowLayout()
    }
    private func setFlowLayout() {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let left: CGFloat = colors.count > 1 ? -20 : 0
        flowLayout.itemSize = CGSize(width: width, height: height)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        cellWidth = width
        // 사용자 입장에서는 두번쨰 페이지를 처음 보게 됨
        collectionView.contentOffset.x = width
    }
}

extension InfiniteScrollViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfiniteScrollViewCollectionViewCell.identifier, for: indexPath) as? InfiniteScrollViewCollectionViewCell else { fatalError() }
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
}

extension InfiniteScrollViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.x)
        preformInfiniteScroll(scrollView: scrollView)
    }
    func preformInfiniteScroll(scrollView: UIScrollView) {
        guard colors.count > 1 else { return }
        let currentPage = scrollView.contentOffset.x
        let firstPage = cellWidth
        let fakeFirstPage = cellWidth * CGFloat(colors.count - 2)
        let lastPage = cellWidth * CGFloat(colors.count - 3)
        let fakeLastPage: CGFloat = 0
        if currentPage == fakeFirstPage {
            print(firstPage)
            scrollView.contentOffset.x = firstPage
        } else if currentPage == fakeLastPage {
            print(lastPage)
            scrollView.contentOffset.x = lastPage
        }
    }
}

// MARK: - UI
extension InfiniteScrollViewController {
    final private func setUI() {
        setBasics()
        setLayout()
    }
    final private func setBasics() {
//        collectionView.backgroundColor = .blue
    }
    final private func setLayout() {
        view.addSubview(collectionView)
        collectionView.register(InfiniteScrollViewCollectionViewCell.self, forCellWithReuseIdentifier: InfiniteScrollViewCollectionViewCell.identifier)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(collectionView.snp.width)
        }
    }
}
