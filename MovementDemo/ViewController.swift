//
//  ViewController.swift
//  MovementDemo
//
//  Created by mr.zhou on 2018/10/7.
//  Copyright © 2018 mr.zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var collectionView: UICollectionView!
    
    var fpsLabel: YYFPSLabel!
    var link: CADisplayLink!
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = DemoLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DemoCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.white
        collectionView.contentInsetAdjustmentBehavior = .never
        
        fpsLabel = YYFPSLabel()
        fpsLabel.frame  = CGRect(x: 200, y: 200, width: 50, height: 30)
        fpsLabel.sizeToFit()
        view.addSubview(fpsLabel)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1001
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DemoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:  indexPath) as! DemoCell
        cell.label.text = "\(indexPath.section)\(indexPath.item)"
        return cell
    }

}

class DemoCell: UICollectionViewCell {
    var label: UILabel!
    var title: String! {
        didSet {
            label.text = title
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.label = UILabel()
        self.label.font = UIFont.systemFont(ofSize: 10)
        self.label.textAlignment = .center
        self.backgroundColor = UIColor(red: CGFloat(arc4random()%255) / 255.0, green: CGFloat(arc4random()%255) / 255.0, blue: CGFloat(arc4random()%255) / 255.0, alpha: 1)
//        contentView.addSubview(label)
    }
    
    override func layoutSubviews() {
        label.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

