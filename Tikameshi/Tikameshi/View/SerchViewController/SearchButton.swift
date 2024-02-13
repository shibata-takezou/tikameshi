//
//  SearchButton.swift
//  Tikameshi
//
//  Created by 柴田武蔵 on 2024/02/12.
//

import UIKit

class SearchButton: ScreenTransitionButton {
    init() {
        super.init(text: "検索")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc override func buttonTapped(_ sender: UIButton) {
        print("検索ボタンを押しました。")
    }
}
