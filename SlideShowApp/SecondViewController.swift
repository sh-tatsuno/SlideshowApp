//
//  SecondViewController.swift
//  SlideShowApp
//
//  Created by 龍野翔 on 2017/01/08.
//  Copyright © 2017年 龍野翔. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var image_view_large: UIImageView!
    var i :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initImageView()
    }
    
    private func initImageView(){
        // UIImage の配列を作る
        var filename :String
        filename = "photos/img_" + String(i+1) + ".jpeg"
        let img: UIImage = UIImage(named:filename)!
        
        // UIImageView 初期化
        image_view_large.image = img
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
