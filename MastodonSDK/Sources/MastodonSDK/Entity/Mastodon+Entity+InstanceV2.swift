import Foundation

extension Mastodon.Entity.V2 {
    /// Instance
    ///
    /// - Since: 4.0.0
    /// - Version: 4.0.3
    /// # Last Update
    ///   2022/12/09
    /// # Reference
    ///  [Document](https://docs.joinmastodon.org/entities/instance/)
    public struct Instance: Codable {
        
        public let domain: String?
        public let title: String
        public let description: String
        public let shortDescription: String?
        public let email: String?
        public let version: String?
        public let languages: [String]?     // (ISO 639 Part 1-5 language codes)
        public let registrations: Mastodon.Entity.V2.Instance.Registrations?
        public let approvalRequired: Bool?
        public let invitesEnabled: Bool?
        public let urls: Mastodon.Entity.Instance.InstanceURL?
        public let statistics: Mastodon.Entity.Instance.Statistics?
        
        public let thumbnail: Thumbnail?
        public let contactAccount: Mastodon.Entity.Account?
        public let rules: [Mastodon.Entity.Instance.Rule]?
        
        // https://github.com/mastodon/mastodon/pull/16485
        public let configuration: Configuration?

        public init(domain: String, approvalRequired: Bool? = nil) {
            self.domain = domain
            self.title = domain
            self.description = ""
            self.shortDescription = nil
            self.email = ""
            self.version = nil
            self.languages = nil
            self.registrations = nil
            self.approvalRequired = approvalRequired
            self.invitesEnabled = nil
            self.urls = nil
            self.statistics = nil
            self.thumbnail = nil
            self.contactAccount = nil
            self.rules = nil
            self.configuration = nil
        }

        enum CodingKeys: String, CodingKey {
            case domain
            case title
            case description
            case shortDescription = "short_description"
            case email
            case version
            case languages
            case registrations
            case approvalRequired = "approval_required"
            case invitesEnabled = "invites_enabled"
            case urls
            case statistics = "stats"
            
            case thumbnail
            case contactAccount = "contact_account"
            case rules
            
            case configuration
        }
    }
}

extension Mastodon.Entity.V2.Instance {
    public struct Configuration: Codable {
        public let statuses: Mastodon.Entity.Instance.Configuration.Statuses?
        public let mediaAttachments: Mastodon.Entity.Instance.Configuration.MediaAttachments?
        public let polls: Mastodon.Entity.Instance.Configuration.Polls?
        public let translation: Mastodon.Entity.V2.Instance.Configuration.Translation?
    
        enum CodingKeys: String, CodingKey {
            case statuses
            case mediaAttachments = "media_attachments"
            case polls
            case translation
        }
    }
}

extension Mastodon.Entity.V2.Instance {
    public struct Registrations: Codable {
        public let enabled: Bool
    }
}

extension Mastodon.Entity.V2.Instance.Configuration {
    public struct Translation: Codable {
        public let enabled: Bool
    }
}

extension Mastodon.Entity.V2.Instance {
    public struct Thumbnail: Codable {
        public let url: String?
    }
}

//extension Mastodon.Entity.V2.Instance {
//    public struct Statuses: Codable {
//        public let maxCharacters: Int
//        public let maxMediaAttachments: Int
//        public let charactersReservedPerURL: Int
//
//        enum CodingKeys: String, CodingKey {
//            case maxCharacters = "max_characters"
//            case maxMediaAttachments = "max_media_attachments"
//            case charactersReservedPerURL = "characters_reserved_per_url"
//        }
//    }
//
//    public struct MediaAttachments: Codable {
//        public let supportedMIMETypes: [String]
//        public let imageSizeLimit: Int
//        public let imageMatrixLimit: Int
//        public let videoSizeLimit: Int
//        public let videoFrameRateLimit: Int
//        public let videoMatrixLimit: Int
//
//        enum CodingKeys: String, CodingKey {
//            case supportedMIMETypes = "supported_mime_types"
//            case imageSizeLimit = "image_size_limit"
//            case imageMatrixLimit = "image_matrix_limit"
//            case videoSizeLimit = "video_size_limit"
//            case videoFrameRateLimit = "video_frame_rate_limit"
//            case videoMatrixLimit = "video_matrix_limit"
//        }
//    }
//
//    public struct Polls: Codable {
//        public let maxOptions: Int
//        public let maxCharactersPerOption: Int
//        public let minExpiration: Int
//        public let maxExpiration: Int
//
//        enum CodingKeys: String, CodingKey {
//            case maxOptions = "max_options"
//            case maxCharactersPerOption = "max_characters_per_option"
//            case minExpiration = "min_expiration"
//            case maxExpiration = "max_expiration"
//        }
//    }
//
//    public struct Translation: Codable {
//        public let enabled: Bool
//    }
//}
