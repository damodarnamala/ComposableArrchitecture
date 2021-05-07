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

    func getNumerFromInput(text: String) -> Int {
        guard let number = Int(text) else { return 0 }
        return number
    }

    func update(state: MathState) {
        DispatchQueue.main.async {
            self.lbl?.text = "\(state.number)"
        }
    }

    @IBAction func add() {
        let number = getNumerFromInput(text: (self.inputField?.text)!)
        self.update(state: store.send(action: .plus(number)))
    }

    @IBAction func decrease() {
        let number = getNumerFromInput(text: (self.inputField?.text)!)
        self.update(state: store.send(action: .minus(number)))
    }

    @IBAction func nextView() {

        guard let controller = storyboard?.instantiateViewController(identifier: "DetailController") as? DetailController else  { return }
        self.present(controller, animated: true)
    }
    

}


class DetailController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberLabel.text = "\(store.state.number)"
    }

    @IBAction func dismiss() {
        self.dismiss(animated: true)
    }    
}
