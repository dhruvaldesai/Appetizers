
import Foundation

struct Appetizer: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    static let orderItem1 = Appetizer(id: 0001,
                                           name: "Asian Flank Steak",
                                           description: "This perfectly thin cut just melts in your mouth.",
                                           price: 8.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
                                           calories: 300,
                                           protein: 14,
                                           carbs: 0)
    
    static let orderItem2 = Appetizer(id: 0002,
                                           name: "Blackened Shrimp",                                           description: "Seasoned shrimp from the depths of the Atlantic Ocean.",
                                           price: 6.99,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
                                           calories: 450,
                                           protein: 4,
                                           carbs: 3)
    
    static let orderItem3 = Appetizer(id: 0003,
                                           name: "Buffalo Chicken Bites",
                                           description: "The tasty bites of chicken have just the right amount of kick to them.",
                                           price: 7.49,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/buffalo-chicken-bites.jpg",
                                           calories: 800,
                                           protein: 5,
                                           carbs: 22)
    
    static let orderItem4 = Appetizer(id: 0004,
                                           name: "Chicken Avocado Spring Roll",
                                           description: "These won't last 10 seconds once they hit the table.",
                                           price: 12.49,
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg",
                                           calories: 480,
                                           protein: 7,
                                           carbs: 19)
    
    static let orderItemMenu = [orderItem1, orderItem2, orderItem3, orderItem4]
}
