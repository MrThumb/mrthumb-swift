import Quick
import Nimble
import MrThumb
import Mockingjay

class ClientSpec: QuickSpec {
    override func spec() {

        let configuration = Configuration(accessId: "XX", secretId: "ZZ")
        let client = Client(withConfiguration: configuration)

        describe("createImage") {
            let url = "http://sample.com/image"
            let transformations = [
                "resize": [
                    "height": 200
                ]
            ]

            func apiRequest(_ configuration: MrThumb.Configuration) -> (_ request: URLRequest) -> Bool {
                return { (request: URLRequest) in
                    let validMethod = http(.post, uri: "/api/v1/images")(request)
                    let validHeader = request.value(forHTTPHeaderField: "Authorization")!.range(of: "^APIAuth XX:(.+)$", options: .regularExpression) != nil

                    return validMethod && validHeader
                }
            }

            beforeEach {
                self.stub(apiRequest(configuration), http(200, headers: [:], download: nil))
            }

            it("returns success on completion") {
                waitUntil { done in
                    client.createImage(url: url, transformations: transformations) { (success, data) in
                        expect(success).to(beTrue())
                        done()
                    }
                }
            }
        }
    }
}
