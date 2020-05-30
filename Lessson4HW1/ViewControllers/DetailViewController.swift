//
//  DetailViewController.swift
//  Lessson4HW1
//
//  Created by vaksakalov on 30.05.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var aboutMeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        aboutMeTextView.text = """
        Немного о себе:
        
        ФИО: Белобородов Владимир
        
        Nickname: Aksakalov Vlad
        
        Возраст: 45 лет
        
        Профессия: экономист
        
        Хобби: программирование (Delphi, Objective-C, VBA и т.д.)
        
        Желания: сейчас хочу научится языку Swift и выпустить собственное приложение для iOS на этом языке
        """
    }
    
}
