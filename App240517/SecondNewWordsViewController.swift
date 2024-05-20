//
//  SecondNewWordsViewController.swift
//  App240517
//
//  Created by 박다현 on 5/20/24.
//

import UIKit

// MARK: - enum를 활용한 신조어 풀이
enum NewlyCoinedWords:String, CaseIterable{
    case 스불재
    case 오뱅알
    case 별다줄
    case 당모치
    case 오우예씨몬
    case 가나디
    case 잼얘
    case 뉴런공유
    case 드르륵칵
}


class SecondNewWordsViewController: UIViewController {

    
    @IBOutlet var searchTextField: UITextField!
    
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var sampleWordButton01: UIButton!
    @IBOutlet var sampleWordButton02: UIButton!
    @IBOutlet var sampleWordButton03: UIButton!
    @IBOutlet var sampleWordButton04: UIButton!
    @IBOutlet var sampleWordButton05: UIButton!
    
    @IBOutlet var backImageView: UIImageView!
    
    @IBOutlet var explainLabel: UILabel!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setSampleWordButtonsUI([sampleWordButton01, sampleWordButton02, sampleWordButton03, sampleWordButton04, sampleWordButton05])
        setSampleButtonName([sampleWordButton01, sampleWordButton02, sampleWordButton03, sampleWordButton04, sampleWordButton05])

    }
    
    func setUpUI(){
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.layer.borderWidth = 3
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        
        backImageView.image = UIImage(named: "background")
        
        explainLabel.text = "검색어를 입력해주세요!"
        explainLabel.numberOfLines = 0
    }
    
    //샘플 단어 UI세팅
    func setSampleWordButtonsUI(_ buttons: [UIButton]){
            buttons.forEach {
                $0.layer.borderColor = UIColor.black.cgColor
                $0.layer.borderWidth = 1
                $0.layer.cornerRadius = 4
                $0.setTitleColor(.black, for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 13)
            }
    }
    
    //샘플단어 버튼 타이틀 랜덤 설정
    func setSampleButtonName(_ buttons: [UIButton]){
        var keys:[String] = []
        for key in NewlyCoinedWords.allCases{
            keys.append(key.rawValue)
        }
        keys = keys.shuffled()
        for i in 0..<buttons.count{
                buttons[i].setTitle(keys[i], for: .normal)
        }
    }

    //키보드 returnKey 액션
    @IBAction func searchTextFieldReturnClicked(_ sender: UITextField) {
        guard let text = searchTextField.text else { return }
        returnExplain(searchText: text.lowercased()) //모두 소문자로 변경하여 대소문자 구분없이 검색
        setSampleButtonName([sampleWordButton01, sampleWordButton02, sampleWordButton03, sampleWordButton04,sampleWordButton05])
    }
    
    //서치 버튼 액션
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let text = searchTextField.text else { return }
        returnExplain(searchText: text.lowercased()) //모두 소문자로 변경하여 대소문자 구분없이 검색
        setSampleButtonName([sampleWordButton01, sampleWordButton02, sampleWordButton03, sampleWordButton04,sampleWordButton05])
    }
    
    //단어 풀이 보여주기
    func returnExplain(searchText:String){
        if let newText = NewlyCoinedWords(rawValue: searchText) {
            switch newText {
            case .스불재:
                explainLabel.text = "스스로 불러온 재앙"
            case .오뱅알:
                explainLabel.text = "오늘 방(뱅)송 알찼다"
            case .별다줄:
                explainLabel.text = "별걸 다 줄이네"
            case .당모치:
                explainLabel.text = "당연히 모든 치킨은 옳다"
            case .오우예씨몬:
                explainLabel.text = "Oh Yeah C’mon 이라는 단어에서 탄생된 밈"
            case .가나디:
                explainLabel.text = "강아지를 앙증맞게 부르는 단어"
            case .잼얘:
                explainLabel.text = "재밌는 이야기"
            case .뉴런공유:
                explainLabel.text = "주로 나와 생각이나 행동이 비슷한 사람을 보고 뉴런을 공유한 것과 같이 유사하다고 말을 할 때 쓰이는 단어"
            case .드르륵칵:
                explainLabel.text = "편의점 야외에 설치된 플라스탁 의자를 지칭"
            }
        }else{
            explainLabel.text = "검색결과가 없습니다."
        }
    }
    
    
    //샘플단어버튼 액션
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        guard let wordKey = sender.titleLabel?.text else { return }
        searchTextField.text =  wordKey
        returnExplain(searchText: wordKey)
    }

}
