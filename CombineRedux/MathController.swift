//
//  ViewController.swift
//  CombineRedux
//
//  Created by Damodar, Namala (623-Extern) on 06/05/21.
//

import UIKit
import Combine


class MathController: UIViewController {
    @IBOutlet weak var lbl: UILabel?
    @IBOutlet weak var inputField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func add() {
        let number = getNumerFromInput(text: (self.inputField?.text)!)
        self.update(state: store.send(action: .plus(number)))
    }

    @IBAction func decrease() {
        let number = getNumerFromInput(text: (self.inputField?.text)!)
        self.update(state: store.send(action: .minus(number)))
    }

    func getNumerFromInput(text: String) -> Int {
        guard let number = Int(text) else { return 0 }
        return number
    }

    func update(state: MathState) {
        DispatchQueue.main.async {
            self.lbl?.text = "\(state.number)"
        }
    }
}

