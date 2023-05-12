
import UIKit

class EECommonView: UIView {
    var customView: UIView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        customView = (Bundle.main.loadNibNamed(self.getClassName(), owner: self, options: nil)!.first as! UIView)
        customView.frame = self.bounds
        customView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        self.addSubview(customView)

        setupClipsToBounds()
    }

    func setupClipsToBounds() {
        clipsToBounds = true
    }


    func getClassName() -> String {
        let str = String(describing: type(of: self))
        if let start = str.firstIndex(of: "<"), let end = str.lastIndex(of: ">") {
            // ジェネリック・クラスに対応
            return str.replacingCharacters(in: start...end, with: "")
        }
        return str
    }
}
