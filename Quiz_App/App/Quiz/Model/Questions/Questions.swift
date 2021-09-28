import Foundation

class Questions {
    
    var listMath = [Question]()
    var listGeography = [Question]()
    var listHistory = [Question]()
    var listBiology = [Question]()
    var listEnglish = [Question]()
    init () {
        
        //Math
        
        listMath.append(Question( questionText: " 2 + 2 ?", choiceA: "5", choiceB: "4", choiceC: "7", choiceD: "10 ", answer: 2))

        listMath.append(Question( questionText: " 5 * 5 ?", choiceA: "3", choiceB: "6", choiceC: "25", choiceD: "10", answer: 3))

        listMath.append(Question( questionText: " 10 * 1 ?", choiceA: "10", choiceB: "6", choiceC: "25", choiceD: "10", answer: 1))

        listMath.append(Question( questionText: " (5/5) - 1 = ?", choiceA: "3", choiceB: "6", choiceC: "0", choiceD: "10", answer: 3))
        
        listMath.append(Question( questionText: " 10 - 1 = ?", choiceA: "9", choiceB: "6", choiceC: "0", choiceD: "10", answer: 1))
        
        listMath.append(Question( questionText: " 8 - 8 = ?", choiceA: "3", choiceB: "6", choiceC: "0", choiceD: "10", answer: 3))


        //Geo
        
        listGeography.append(Question( questionText: "How many plantets are in our solar system?", choiceA: "5", choiceB: "6", choiceC: "7", choiceD: "8", answer: 4))
        
        listGeography.append(Question( questionText: "Which is the smallest continent in the world?", choiceA: "Australia" , choiceB: "Europe" , choiceC: "Africa" , choiceD: "Asia", answer: 1))
        
        listGeography.append(Question( questionText: "In which direction does the sunrise?", choiceA: "South", choiceB: "East", choiceC: "West", choiceD: "North", answer: 2))
        
        listGeography.append(Question( questionText: "Which Italian city is famous for its canals?", choiceA: "Rome", choiceB: "Genova", choiceC: "Milan", choiceD: "Venice", answer: 4))
        
        listGeography.append(Question( questionText: "What is the largest sea in the world?", choiceA: "Baltic Sea", choiceB: "The Caspian Sea", choiceC: "Black Sea", choiceD: "Adriatic Sea", answer: 2))
        
        listGeography.append(Question( questionText: "What is the longest river in the world?", choiceA: "Amazon", choiceB: "Volga", choiceC: "Nile", choiceD: "Niger", answer: 3))
        
        //History
        
        listHistory.append(Question( questionText: "Who first discovered America?", choiceA: "Leif Eriksson", choiceB: "Galileo Galilei", choiceC: "Martin Luter King", choiceD: "Cristiano Columbus", answer: 1))
        
        listHistory.append(Question( questionText: "Where did the Olympic Games originate?", choiceA: "USA", choiceB: "Greece", choiceC: "France", choiceD: "Japan", answer: 2))
        
        listHistory.append(Question( questionText: "How long lasted World War 2?", choiceA: "4 years (1935-1940)", choiceB: "5 years (1939-1944)", choiceC: "World War 2 didn't happend", choiceD: "6 years (1939-1945)", answer: 4))
        
        listHistory.append(Question( questionText: "Who was the leader of the Nazi party?", choiceA: "Adolf Hitler", choiceB: "Joseph Stalin", choiceC: "Vladimir Lenin", choiceD: "Franklin Roosevelt", answer: 1))
        
        listHistory.append(Question( questionText: "What was the name of the horse of Alexandar the Great?", choiceA: "Tucker", choiceB: "Bailey", choiceC: "Alexia", choiceD: "Bucephalus", answer: 4))
        
        listHistory.append(Question( questionText: "In which year happened Chernobyl disaster?", choiceA: "1986", choiceB: "1998", choiceC: "1969", choiceD: "1987", answer: 1))
        
        //Biology
        
        listBiology.append(Question( questionText: "A person who studies biology is known as a ?", choiceA: "Botanist", choiceB: "Biologist", choiceC: "Physicist", choiceD: "Geographist", answer: 2))
        
        listBiology.append(Question( questionText: "Botany is the study of?", choiceA: "Potatos", choiceB: "Fruits", choiceC: "Vegeis", choiceD: "Plants", answer: 4))
        
        listBiology.append(Question( questionText: "Animals which eat both plants and other animals are knowns as what?", choiceA: "Omnivores", choiceB: "Herbivore", choiceC: "Carnivore", choiceD: "Raccoon", answer: 1))
        
        listBiology.append(Question( questionText: "Which organ in the human body pupms blood?", choiceA: "Skin", choiceB: "Heart", choiceC: "Lungs", choiceD: "Kidneys", answer: 2))
        
        listBiology.append(Question( questionText: "Besides light, what do trees and flowers require to grow?", choiceA: "Water", choiceB: "Snow", choiceC: "Juice", choiceD: "None of above", answer: 1))
        
        listBiology.append(Question( questionText: "What does fauna mean?", choiceA: "All types of dogs", choiceB: "All the plant life", choiceC: "All of the animal planet", choiceD: "Only the Sea planet", answer: 3))
        
        //English
        
        listEnglish.append(Question( questionText: "Identify the noun in the following sentence: I live in Amsterdam?", choiceA: "I", choiceB: "live", choiceC: "in", choiceD: "Amsterdam", answer: 4))
        
        listEnglish.append(Question( questionText: "Identify the pronoun in the following sentence: They were having dinner.", choiceA: "They", choiceB: "were", choiceC: "having", choiceD: "dinner", answer: 1))
        
        listEnglish.append(Question( questionText: "Identify the verb in the following sentence: Jack left in a hurry.", choiceA: "Left", choiceB: "A", choiceC: "in", choiceD: "Jack", answer: 1))
        
        listEnglish.append(Question( questionText: "Fill In The Blanks. The students are ______ their notes.", choiceA: "Wrote", choiceB: "Written", choiceC: "Writing", choiceD: "Writing", answer: 3))
        
        listEnglish.append(Question( questionText: "Fill In The Blanks. The doctor ___ out for ten minutes.", choiceA: "Go", choiceB: "Going", choiceC: "Gone", choiceD: "Went", answer: 4))
        
        listEnglish.append(Question( questionText: "Correct the statement with a suitable punctuation mark. When will you return from your dance rehearsal", choiceA: "Exclamation mark (!)", choiceB: "Fullstop (.)", choiceC: "Comma (,)", choiceD: "Question mark (?)", answer: 4))
        
    }
    
    func questions(for category: Category) -> [Question] {
        
        switch category {
        case .Math:
            return listMath
        case .Geography:
            return listGeography
        case .History:
            return listHistory
        case .Biology:
            return listBiology
        case .English:
            return listEnglish
        }
    }
    
}
