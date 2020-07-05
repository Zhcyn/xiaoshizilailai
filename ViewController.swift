//
//  ViewController.swift
//  LionSticker
//
//  Created by 禚恒 on 2020/7/5.
//  Copyright © 2020 WinterOS. All rights reserved.
//

import UIKit
let titleBarHeight: CGFloat = 40.0
let tabViewHeight: CGFloat = 40.0

let kUIScreenWidth = UIScreen.main.bounds.size.width
let kUIScreenHeight = UIScreen.main.bounds.size.height
class ViewController: UIViewController {
    
    
    var stickers = NSArray()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
     
        
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
      
        
        layout.minimumLineSpacing = 10.0
      
        
        layout.minimumInteritemSpacing = 10.0
     
        
        let viewHeight: CGFloat = UIScreen.main.bounds.size.height
        
        
        let frame = CGRect.init(x: 0, y: 200+titleBarHeight, width: kUIScreenWidth, height: kUIScreenHeight-200-titleBarHeight)
     
        
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        return collectionView
    }()

    //MARK: - Private Property
    private var toIndex: Int = 0
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        loadData()
        configSubviews()
    }
    
    public func loadData() {
        stickers = ["LionSticker 1","LionSticker 2","LionSticker 3","LionSticker 4","LionSticker 5","LionSticker 6","LionSticker 7","LionSticker 8","LionSticker 9","LionSticker 10","LionSticker 11","LionSticker 12","LionSticker 13","LionSticker 14","LionSticker 15","LionSticker 16","LionSticker 17","LionSticker 18","LionSticker 19","LionSticker 20","LionSticker 21","LionSticker 22","LionSticker 23","LionSticker 24","LionSticker 25","LionSticker 26","LionSticker 27","LionSticker 28","LionSticker 29","LionSticker 30","LionSticker 31","LionSticker 32","LionSticker 33","LionSticker 34","LionSticker 35","LionSticker 36","LionSticker 37","LionSticker 38","LionSticker 39","LionSticker 40"]
    }

    //MARK: - Private Mehtods
    private func configSubviews() {
        self.view.backgroundColor = .white
        
        let headerView = UIView()
      
        
        headerView.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.5921568627, blue: 0.3450980392, alpha: 1)
       
        
        headerView.frame = CGRect(x: 0, y: titleBarHeight, width: kUIScreenWidth, height: 200)
      
        
        self.view.addSubview(headerView)
        
        let imageView = UIImageView()
        
        
        imageView.image = UIImage(named: "HeaderIMG")
        
        
        imageView.contentMode = .scaleAspectFit
   
        
        imageView.frame = CGRect(x: 0, y: 0, width:kUIScreenWidth , height: 200)
     
        
        headerView.addSubview(imageView)
        
        
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.5921568627, blue: 0.3450980392, alpha: 1)
    
        
        collectionView.showsVerticalScrollIndicator = false
    
        
        collectionView.register(LionCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(LionCollectionViewCell.self))
    
        
        collectionView.dataSource = self
   
        
        collectionView.delegate = self
     
        
        self.view.addSubview(collectionView)
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stickers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LionCollectionViewCell.self), for: indexPath) as? LionCollectionViewCell {
            cell.configView(titleString: (stickers[indexPath.row] as! NSString))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = UIImage(named: stickers[indexPath.row] as! String)
        let activityVC = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        // 如果是ipad, 那么需要使用pop的方式显示方向界面
        present(activityVC, animated: true, completion: nil)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: (UIScreen.main.bounds.size.width - 40) / 4.5, height: (UIScreen.main.bounds.size.width - 40) / 4.5)
        return size
    }
    
    
    
    
}


extension UIColor {
    //返回随机颜色
    class var randomColor: UIColor {
        get
        {
            let red = CGFloat(arc4random() % 256) / 255.0
            let green = CGFloat(arc4random() % 256) / 255.0
            let blue = CGFloat(arc4random() % 256) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
