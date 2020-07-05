//
//  LionCollectionViewCell.swift
//  LionSticker
//
//  Created by 禚恒 on 2020/7/5.
//  Copyright © 2020 WinterOS. All rights reserved.
//

import UIKit

class LionCollectionViewCell: UICollectionViewCell {
    
    func configView(titleString: NSString?) {
        bgImageView.image = UIImage(named: titleString! as String)
    }
    
    private lazy var bgImageView: UIImageView = {
        var bgImageView = UIImageView()
        return bgImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func initViews() {
        self.contentView.backgroundColor = .white
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.frame = contentView.frame
        self.contentView.addSubview(bgImageView)
        
    }
}
