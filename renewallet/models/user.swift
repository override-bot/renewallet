struct UserData: Codable {
    let success: Bool
    let data: UserDataDetails
    let imageUrl: String
}

struct UserDataDetails: Codable {
    let email: String
    let firstname: String
    let lastname: String
    let username: String
    let password: String
    let balance: Int
    let profilePhoto: String
    let phone: Int
    let id: String
    let transactions: [String]
    let createdAt: String
    let updatedAt: String
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(String.self, forKey: .email)
        self.firstname = try container.decode(String.self, forKey: .firstname)
        self.lastname = try container.decode(String.self, forKey: .lastname)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
        self.balance = try container.decode(Int.self, forKey: .balance)
        self.profilePhoto = try container.decode(String.self, forKey: .profilePhoto)
        self.phone = try container.decode(Int.self, forKey: .phone)
        self.id = try container.decode(String.self, forKey: .id)
        self.transactions = try container.decode([String].self, forKey: .transactions)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
    }
    enum CodingKeys: String, CodingKey {
        case email, firstname, lastname, username, password, balance, profilePhoto, phone, id = "_id", transactions, createdAt, updatedAt
    }
}
