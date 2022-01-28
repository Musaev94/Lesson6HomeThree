//
//  ViewController.swift
//  Lesson6HomeThree
//
//  Created by user on 28/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { // UICollectionViewDelegateFlowLayout отвечает за позицию верт или горизонтальную
    
    private lazy var tittokBot: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "1")
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
                view.delegate = self
                view.dataSource = self
                view.isPagingEnabled = true
                view.register(TestCellWork.self, forCellWithReuseIdentifier: "TestCellWork")
                return view

    }()
    
    private lazy var tiktokLenta = ["11", "22", "33"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        
        view.addSubview(tittokBot)
        tittokBot.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().inset(420)
        }
        
        view.addSubview(collectionView)
                collectionView.snp.makeConstraints { make in
                    make.bottom.equalTo(tittokBot.snp.top)
                    make.top.equalToSuperview()
                    make.width.equalToSuperview()
                }

        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(
                width: view.frame.width,
                height: view.frame.height * 0.9099)
    
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return tiktokLenta.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let index = indexPath.row
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCellWork", for: indexPath) as! TestCellWork
            
            cell.titleView.image = UIImage(named: String(tiktokLenta[index]))
            
            return cell
        }

}
