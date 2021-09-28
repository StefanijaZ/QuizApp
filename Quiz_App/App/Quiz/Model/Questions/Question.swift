
import Foundation
class Question {
//    let photoView: String
    let questionLabel: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correctAnswer: Int
    
    init(
//        image: String,
         questionText: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, answer: Int){
//        photoView = image
        questionLabel = questionText.localized
        optionA = choiceA.localized
        optionB = choiceB.localized
        optionC = choiceC.localized
        optionD = choiceD.localized
        correctAnswer = answer
    }
}

