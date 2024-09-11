
import Foundation


var greeting = "Hello, playground"

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

let rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
///Stored Properties of Constant Structure Instances
//rangeOfThreeItems.firstValue = 6

// Lazy Stored Properties
  ///A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used. You indicate a lazy stored property by writing the lazy modifier before its declaration.
///Note
///You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore can’t be declared as lazy.
///
///
class Example {
    // Normal property
    let normalProperty: String = {
        print("Normal property initialized")
        return "Normal"
    }()
    
    // Lazy property
    lazy var lazyProperty: String = {
        print("Lazy property initialized")
        return "Lazy"
    }()
}
// Creating an instance of Example
let example = Example()
example.lazyProperty

// Lazy properties usage

// Example: 1
class NetworkManager {
    // Properties
    var baseURL: String
    private var apiKey: String
    // Lazy property
    lazy var networkClient: NetworkClient = {
        // Initialize NetworkClient with baseURL and apiKey
        return NetworkClient(baseURL: baseURL, apiKey: apiKey)
    }()
    // Initializer
    init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    // Function to make a request using networkClient
    func fetchData(endpoint: String, completion: @escaping (Data?) -> Void) {
        networkClient.makeRequest(to: endpoint, completion: completion)
    }
}

// Helper NetworkClient class
class NetworkClient {
    private let baseURL: String
    private let apiKey: String
    init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    func makeRequest(to endpoint: String, completion: @escaping (Data?) -> Void) {
        // Perform network request here
        print("Making request to \(baseURL)/\(endpoint) with API key \(apiKey)")
        // Example implementation (mock response)
        completion(Data())
    }
}
// Usage
let networkManager = NetworkManager(baseURL: "https://api.example.com", apiKey: "12345")
// `networkClient` is initialized only when needed
networkManager.fetchData(endpoint: "data") { data in
    // Handle response
}

// Example 2:
/*
class ImageLoader {
    private let imagePath: String
    // Lazy property to hold the UIImage object
    lazy var image: UIImage? = {
        // Load image from disk
        guard let image = UIImage(contentsOfFile: imagePath) else {
            print("Failed to load image at path: \(imagePath)")
            return nil
        }
        return image
    }()
    // Initializer
    init(imagePath: String) {
        self.imagePath = imagePath
    }
}

// Usage
let imagePath = "/path/to/large/image.png"
let imageLoader = ImageLoader(imagePath: imagePath)
// The image is loaded only when accessed for the first time
if let image = imageLoader.image {
    // Use the loaded image
    print("Image successfully loaded.")
} else {
    print("Image loading failed.")
}*/

//Example:3
class UserProfile {
    // Regular properties
    var firstName: String
    var lastName: String
    // Lazy property
    lazy var fullName: String = {
        // Complex computation or external resource interaction
        return "\(firstName) \(lastName)"
    }()
    // Initializer
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// Usage
let userProfile = UserProfile(firstName: "John", lastName: "Doe")
// `fullName` is computed only when accessed for the first time
print(userProfile.fullName) // Output: John Doe
