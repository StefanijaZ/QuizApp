import UIKit

class QuizViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard

    var allQuestions = [Question]()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    var seconds = 20
    var timer = Timer()
    var points: Int = 0
    var selectedCategory: Category!
    var question: Questions = Questions()
    
    @IBOutlet weak var clockView: UIView!

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @objc func counter() {
        seconds -= 1
        label.text = String(seconds)
        
        if (seconds == 0) {
          timer.invalidate()

            
            let t = "Awesome"
            let m = "End of quiz. Do you want to start over?"
            let r = "Restart"
            
            let alert = UIAlertController(title: t.localized, message: m.localized, preferredStyle: .alert)
                        
            let restartAction = UIAlertAction(title: r.localized, style: .default, handler: {action in self.restartQuiz()})
                        
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text =  "\(score)"
        
        allQuestions = question.questions(for: selectedCategory)
        updatedColor()
        updateQuestion()
        updateUI()
        CountdownAnimation.startAnimation( countdownView: clockView, duration: 20)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuizViewController.counter), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            print("correct")
            score += 1
            
            
        }else{
            print("wrong")
        }
        
        questionNumber += 1
        updateQuestion()
        
    }
    
    
    func updateQuestion(){
        
        if questionNumber <= allQuestions.count - 1{
            
//            photoView.image = UIImage(named:(allQuestions.list[questionNumber].photoView))
            
            questionLabel.text = allQuestions[questionNumber].questionLabel
            
            optionA.setTitle(allQuestions[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions[questionNumber].optionB, for: UIControl.State.normal)
            optionC.setTitle(allQuestions[questionNumber].optionC, for: UIControl.State.normal)
            optionD.setTitle(allQuestions[questionNumber].optionD, for: UIControl.State.normal)
                    
            selectedAnswer = (allQuestions[questionNumber].correctAnswer)
        }
        
        else{
            timer.invalidate()
            
            setUserPoints()
            
            let m = "End of quiz. Do you want to start over?"
            let t = "Awesome"
            let alert = UIAlertController(title: t.localized, message: m.localized, preferredStyle: .alert)
            
            let r = "Restart"
            let restartAction = UIAlertAction(title: r.localized, style: .default, handler: {action in self.restartQuiz()})
            
            let back = "Back"
            let backAction = UIAlertAction(title: back.localized, style: .default, handler: {action in
                self.navigationController?.popViewController(animated: true)
            })
            alert.addAction(restartAction)
            alert.addAction(backAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()
          
        
    }
    func updateUI() {
        scoreLabel.text = "\(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.count)"
    }
    
    func updatedColor(){
        var color: UIColor?
        switch selectedCategory {
        case .Math:
            color = UIColor(red: 197/255, green: 210/255, blue: 241/255, alpha: 1)
        case .Biology:
            color = UIColor(red: 231/255, green: 168/255, blue: 206/255, alpha: 1)
        case .Geography:
            color = UIColor(red: 246/255, green: 211/255, blue: 104/255, alpha: 1)
        case .English:
            color = UIColor(red: 240/255, green: 113/255, blue: 56/255, alpha: 1)
        case .History:
            color = UIColor(red: 135/255, green: 235/255, blue: 183/255, alpha: 1)
            
        default:
            color = UIColor(red: 222/255, green: 211/255, blue: 104/255, alpha: 1)
        }
        optionA.backgroundColor = color
        optionB.backgroundColor = color
        optionC.backgroundColor = color
        optionD.backgroundColor = color
        headerView.backgroundColor = color
    }
    
    func setUserPoints()
    {
        let encoder = JSONEncoder()
        var userSelected : User?
        let userId = userDefaults.string(forKey: "app")
        if let usersData = userDefaults.data(forKey: "users")
        {
            do{
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: usersData)
                for user in users {
                    if userId == user.id
                    {
                        userSelected = user
                        userSelected!.updatePoints(points: score)
                        break
                    }
                }
                if let userSelected = userSelected
                {
                    var updatedUsers = users.filter({$0.id != userId})
                    updatedUsers.append(userSelected)
                    let data = try encoder.encode(updatedUsers)
                    UserDefaults.standard.set(data, forKey: "users")
                }
            }
            catch {
                print ("catch")
            }
        }
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
        timer.invalidate()
        seconds = 20
        label.text = "20"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuizViewController.counter), userInfo: nil, repeats: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let navigationViewController = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController

        let vc = navigationViewController.viewControllers.first as! HomeViewController
        vc.finalPoints = score
    }
}
