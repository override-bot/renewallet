import Foundation
class UserViewmodel: ObservableObject {
  @Published var user: UserDataDetails?
  @Published var errorMessage: String?
    @Published var isError:Bool = false
  
  func signUp(email: String, password: String) {
    // Construct the URL and request object
    guard let url = URL(string: "https://yourapi.com/signup") else {
      self.errorMessage = "Invalid URL"
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Construct the request body
      let requestBody = [
      "email": email,
      "password": password,
      "firstname": "",
      "lastname": "",
      "phone": 0
      ] as [String : Any]
    request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
    
    // Send the network request
    URLSession.shared.dataTask(with: request) { data, response, error in
      if let error = error {
        self.errorMessage = error.localizedDescription
          self.isError = true
        return
      }
      
      // Parse the response data into a User object
      guard let data = data else {
        self.errorMessage = "No data received"
          self.isError = true
        return
      }
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      guard let user = try? decoder.decode(UserData.self, from: data) else {
        self.errorMessage = "Failed to decode response"
          self.isError = true
        return
      }
      
      // Update the user object and clear any error message
      DispatchQueue.main.async {
          self.user = user.data
        self.errorMessage = nil
      }
    }.resume()
  }
}
