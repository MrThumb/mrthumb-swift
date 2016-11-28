import HMACSigner

public class Client {

    let configuration: Configuration
    let http: HTTPClient

    public init(withConfiguration configuration: Configuration) {
        self.configuration = configuration
        self.http = HTTPClient(withConfiguration: configuration)
    }

    public func createImage(url: String, transformations: [String: [String: Any]],
                            completion: @escaping (Bool, Data?) -> ()) -> () {
        self.http.post(to: "/api/v1/images", parameters: [
            "url": url,
            "transformations": transformations
        ], completion: completion)
    }

}
