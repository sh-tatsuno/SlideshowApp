//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 龍野翔 on 2017/01/08.
//  Copyright © 2017年 龍野翔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var button_mode:Bool = false
    @IBOutlet weak var button_outlet: UIButton!
    @IBOutlet weak var bbutton_outlet: UIButton!
    @IBOutlet weak var fbutton_outlet: UIButton!
    @IBOutlet weak var image_view: UIImageView!
    var timer: Timer! //タイマー
    var imageListArray :Array<UIImage> = [] //画像配列
    var i :Int = 0 //現在の画像ナンバー
    
    let img_num :Int = 6 //画像の総枚数
    
    //戻るボタン
    @IBAction func bbutton(_ sender: Any) {
        if (i == 0) {
            i = img_num
        }
        i -= 1
        
        image_view.image = imageListArray[i]
    }
    
    //進むボタン
    @IBAction func fbutton(_ sender: Any) {
        i = (i+1) % img_num
        image_view.image = imageListArray[i]
    }
    
    //再生・停止ボタン
    @IBAction func button(_ sender: Any) {
        if (button_mode){ //再生中：押したら停止処理
            self.button_outlet.setTitle("再生", for: .normal)
            self.bbutton_outlet.isEnabled = true
            self.fbutton_outlet.isEnabled = true
            timer.invalidate()
            button_mode = false
        }else{ //停止中：押したら再生処理
            self.button_outlet.setTitle("停止", for: .normal)
            self.bbutton_outlet.isEnabled = false
            self.fbutton_outlet.isEnabled = false
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            timer.fire()
            button_mode = true
        }
    }
    
    //segue
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initImageView()
    }
    
    //スライドショーモード
    func update(tm: Timer) {
        i = (i+1) % img_num
        image_view.image = imageListArray[i]
    }
    
    private func initImageView(){
        // UIImage の配列を作る
        var filename :String
        repeat{
            i += 1
            filename = "photos/img_" + String(i) + ".jpeg"
            imageListArray.append(UIImage(named:filename)!)
        }while i<img_num
        
        // UIImageView 初期化
        image_view.image = imageListArray[0]
        
        //ナンバーの初期化
        i = 0
        
        let gesture = UITapGestureRecognizer(target:self, action:Selector(("didClickImageView:")))
        //image_view.addGestureRecognizer(gesture)
        
    }
    
    func didClickImageView(recognizer: UIGestureRecognizer) {
        print ("Swift")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

