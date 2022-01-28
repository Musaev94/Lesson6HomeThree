//
//  TestCellWork.swift
//  Lesson6HomeThree
//
//  Created by user on 28/1/22.
//

import Foundation
import UIKit

// это кастомная ячейка которая наслед от UICollectionViewCell
class TestCellWork: UICollectionViewCell {
    
    lazy var titleView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    override func layoutSubviews() {
        
        addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    
    }
}
