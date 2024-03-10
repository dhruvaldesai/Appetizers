import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let basedURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    let appetizerURL = basedURL + "appetizers"
    
    //    func getAppetizer (completed: @escaping(Result<[Appetizer], APError>) -> Void){
    ////        1. get URL
    //        guard let url = URL(string: appetizerURL) else {
    //            completed(.failure(.invalidURL))
    //             return
    //        }
    //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
    //
    //            if error != nil {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            let decoder = JSONDecoder()
    //            do {
    //                let decodeData = try decoder.decode(AppetizerResponse.self, from: data)
    //                completed(.success(decodeData.request))
    //            }
    //            catch {
    //                completed(.failure(.invalidData))
    //            }
    //
    //        }
    //
    //        task.resume()
    //
    //    }
    
    
    
    func getAppetizer() async throws -> [Appetizer] {
        
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(AppetizerResponse.self, from: data)
            return decodeData.request
        }
        catch {
            throw APError.invalidData
        }
    }
}
