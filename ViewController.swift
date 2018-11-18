
import UIKit

class ViewController: UIViewController {

    // Story and answer strings
    let story1 = "You\'ve been working all day, dreaming of what to eat after your 13 and a half hour shift. You\'ve got two options this late at night."
    let answer1a = "Taco Bell"
    let answer1b = "Chick-fil-a"
    
    
    let story2 = "You pull up to the drive through, but it was too late. They have already closed! There is just enought time to make it to Taco Bell if you hurry now. What shall you do?"
    let answer2a = "Drift your way back to Taco Bell."
    let answer2b = "Go home and wonder what could have been."
    
    let story3 = "You gaze into the light at the end of the tunnel. It's the beautiful menu glowing in the night. You have two options to satisfy your cravings."
    let answer3a = "The Cheesy Gordita Crunch"
    let answer3b = "The Legendary Beefy Crunch Burrito"
    
    let story4 = "I\'m not mad, I\'m just dissapointed."
    let story5 = "May the Legend of the Beefy Crunch Burrito be told for generations to come."
    let story6 = "May your future be cheesy and forever crunchy."
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var food: UIImageView!
    // Initialise instance variables
    var storyIndex = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topButton.applyDesign()
        bottomButton.applyDesign()
        restartButton.applyDesign()
        restart()
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        if sender.tag == 1 && (storyIndex == 1 || storyIndex == 2) {
            // Dried up code by adding Or statement
            // print("Top Button Pressed")
            storyTextView.text = story3
            topButton.setTitle(answer3a, for: .normal)
            bottomButton.setTitle(answer3b, for: .normal)
            storyIndex = 3
        } else if sender.tag == 2 && storyIndex == 1 {
            // print("Bottom Button Pressed")
            storyTextView.text = story2
            topButton.setTitle(answer2a, for: .normal)
            bottomButton.setTitle(answer2b, for: .normal)
            storyIndex = 2
        } else if sender.tag == 1 && storyIndex == 3 {
            storyTextView.text = story6
            topButton.isHidden = true
            bottomButton.isHidden = true
            food.isHidden = false
            food.image = UIImage(named: "gordita")
            storyIndex = 6
        } else if sender.tag == 2 && storyIndex == 3 {
            storyTextView.text = story5
            topButton.isHidden = true
            bottomButton.isHidden = true
            food.isHidden = false
            food.image = UIImage(named: "Taco-Bell-Beefy-Crunch-Burrito")
            storyIndex = 5
        } else if sender.tag == 2 && storyIndex == 2 {
            storyTextView.text = story4
            topButton.isHidden = true
            bottomButton.isHidden = true
            storyIndex = 4
        }
        
        if storyIndex == 4 || storyIndex == 5 || storyIndex == 6 {
            restartButton.isHidden = false
            // show restart button
        }
    
        
        
    }
    

    @IBAction func restartPressed(_ sender: UIButton) {
            restart()
    }
    
    // Restart function to set story back to beggining and reset button display
    func restart() {
        restartButton.isHidden = true
        storyIndex = 1
        storyTextView.text = story1
        topButton.setTitle(answer1a, for: .normal)
        bottomButton.setTitle(answer1b, for: .normal)
        topButton.isHidden = false
        bottomButton.isHidden = false
        food.isHidden = true
    }

}

// Extension to edit button design progrommatically
extension UIButton {
    func applyDesign() {
        self.layer.cornerRadius = self.frame.height / 2
        // Smooth corners
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

