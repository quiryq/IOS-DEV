import UIKit

struct FlowerItem {
    let name: String
    let imageName: String
}

class ViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var flowerImageView: UIImageView!
    @IBOutlet weak var flowerNameLabel: UILabel!
    @IBOutlet weak var randomButton: UIButton!

    private var items: [FlowerItem] = []
    private let savedIndexKey = "savedFlowerIndex"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
        restoreLastSelected()
    }

    private func setupData() {
        items = [
            FlowerItem(name: "Rose", imageName: "Flower1"),
            FlowerItem(name: "Tulip", imageName: "Flower2"),
            FlowerItem(name: "Daisy", imageName: "Flower3"),
            FlowerItem(name: "Sunflower", imageName: "Flower4"),
            FlowerItem(name: "Lily", imageName: "Flower5"),
            FlowerItem(name: "Orchid", imageName: "Flower6"),
            FlowerItem(name: "Peony", imageName: "Flower7"),
            FlowerItem(name: "Cherry Blossom", imageName: "Flower8"),
            FlowerItem(name: "Carnation", imageName: "Flower9"),
            FlowerItem(name: "Lavender", imageName: "Flower10")
        ]
    }

    private func setupUI() {
        view.backgroundColor = UIColor.systemGray6

        // Card styling
        cardView.layer.cornerRadius = 20
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.15
        cardView.layer.shadowOffset = CGSize(width: 0, height: 6)
        cardView.layer.shadowRadius = 12
        cardView.backgroundColor = UIColor.white

        flowerImageView.contentMode = .scaleAspectFit
        flowerImageView.layer.cornerRadius = 12
        flowerImageView.clipsToBounds = true

        flowerNameLabel.textAlignment = .center
        flowerNameLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)

        randomButton.layer.cornerRadius = 14
        randomButton.setTitle("Randomize Flower", for: .normal)
        randomButton.backgroundColor = UIColor.systemBlue
        randomButton.setTitleColor(.white, for: .normal)
        randomButton.layer.shadowColor = UIColor.black.cgColor
        randomButton.layer.shadowOpacity = 0.18
        randomButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        randomButton.layer.shadowRadius = 6
    }

    @IBAction func randomizeTapped(_ sender: UIButton) {
        showRandom()
    }

    private func showRandom() {
        guard !items.isEmpty else { return }
        let index = Int.random(in: 0..<items.count)
        updateUI(for: index)
        UserDefaults.standard.set(index, forKey: savedIndexKey)
    }

    private func restoreLastSelected() {
        let savedIndex = UserDefaults.standard.integer(forKey: savedIndexKey)
        if savedIndex < items.count {
            updateUI(for: savedIndex)
        } else {
            showRandom()
        }
    }

    private func updateUI(for index: Int) {
        let item = items[index]
        flowerNameLabel.text = item.name
        flowerImageView.image = UIImage(named: item.imageName)
    }
}
