//
//  ViewController.swift
//  App240517
//
//  Created by 박다현 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {

    // 감정 버튼 아웃렛
    @IBOutlet var emotionButton01: UIButton!
    @IBOutlet var emotionButton02: UIButton!
    @IBOutlet var emotionButton03: UIButton!
    @IBOutlet var emotionButton04: UIButton!
    @IBOutlet var emotionButton05: UIButton!
    @IBOutlet var emotionButton06: UIButton!
    @IBOutlet var emotionButton07: UIButton!
    @IBOutlet var emotionButton08: UIButton!
    @IBOutlet var emotionButton09: UIButton!
    // 감정 레이블 아웃렛
    @IBOutlet var emotionLabel01: UILabel!
    @IBOutlet var emotionLabel02: UILabel!
    @IBOutlet var emotionLabel03: UILabel!
    @IBOutlet var emotionLabel04: UILabel!
    @IBOutlet var emotionLabel05: UILabel!
    @IBOutlet var emotionLabel06: UILabel!
    @IBOutlet var emotionLabel07: UILabel!
    @IBOutlet var emotionLabel08: UILabel!
    @IBOutlet var emotionLabel09: UILabel!
    
    @IBOutlet var resetButton: UIButton!

    
    // 감정 버튼 배열에 담기
    lazy var emtionbuttons:[UIButton] = [emotionButton01, emotionButton02, emotionButton03, emotionButton04, emotionButton05, emotionButton06, emotionButton07, emotionButton08, emotionButton09]
    
    // 감정 레이블 배열에 담기
    lazy var emotionLabels:[UILabel] = [emotionLabel01, emotionLabel02,emotionLabel03,emotionLabel04,emotionLabel05,emotionLabel06,emotionLabel07,emotionLabel08,emotionLabel09]
    
    // 감정 레이블 text 배열에 담기
    let emtionWords = ["행복해", "좋아해", "당황해", "속상해", "멍해", "우울해", "심심해", "사랑해", "지독해"]
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background01")!)
        configureResetButton()
        setButtonImages()
        setEmotionLabel()
        configrueEmotionCount()
       
    }
    
    func configureResetButton(){
        resetButton.titleLabel?.text = "RESET"
        resetButton.backgroundColor = .brown
        resetButton.layer.cornerRadius = 8
        resetButton.setTitleColor(.white, for: .normal)
    }
    
    //버튼 태그값 초기 설정
    func configrueEmotionCount(){
        for i in 0..<emtionbuttons.count{
            emtionbuttons[i].tag = UserDefaults.standard.integer(forKey: "emotion\(i)")
        }
    }

    //button이미지 세팅
    func setButtonImages(){
        for i in 0...emtionbuttons.count - 1{
            let imageName = "slime\(i + 1)"
            emtionbuttons[i].setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }

    //label text 초기 세팅
    func setEmotionLabel(){
        var i = 0
        
        emotionLabels.forEach {
            $0.textAlignment = .center
            $0.text = "\(emtionWords[i]) \(UserDefaults.standard.integer(forKey: "emotion\(i)"))"
            i += 1
        }
    }
    
    //감정 버튼 클릭시 액션
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        let tag = sender.tag
        
        guard let index = emtionbuttons.firstIndex(of: sender) else { return }
        print(index)
        emotionLabels[index].text = "\(emtionWords[index]) \(tag + 1)"
        sender.tag += 1
        UserDefaults.standard.set(sender.tag, forKey: "emotion\(index)")
        
    }
    
    //리셋 버튼 클릭 액션
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        var i = 0
        //라벨 값 & UserDefaults 값 초기화
        emotionLabels.forEach {
            $0.textAlignment = .center
            $0.text = "\(emtionWords[i]) 0"
            UserDefaults.standard.set(0, forKey: "emotion\(i)")
            i += 1
        }
        
    }
}

