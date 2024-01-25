// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WardsByIdsQuery: GraphQLQuery {
  public static let operationName: String = "WardsByIds"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query WardsByIds($id: ID!) { wardById(id: $id) { __typename publicInformation { __typename name { __typename fullName } story city photo { __typename url(asAttachment: false) } } } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: PomoshAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wardById", WardById?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Подопечный с указанным идентификатором
    public var wardById: WardById? { __data["wardById"] }

    /// WardById
    ///
    /// Parent Type: `Ward`
    public struct WardById: PomoshAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.Ward }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("publicInformation", PublicInformation.self),
      ] }

      /// Общедоступная информация о подопечном
      public var publicInformation: PublicInformation { __data["publicInformation"] }

      /// WardById.PublicInformation
      ///
      /// Parent Type: `WardPublicInformation`
      public struct PublicInformation: PomoshAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.WardPublicInformation }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", Name.self),
          .field("story", String.self),
          .field("city", String.self),
          .field("photo", Photo.self),
        ] }

        /// Имя
        public var name: Name { __data["name"] }
        /// История подопечного
        public var story: String { __data["story"] }
        /// Населённый пункт проживания
        public var city: String { __data["city"] }
        /// Фотография подопечного
        public var photo: Photo { __data["photo"] }

        /// WardById.PublicInformation.Name
        ///
        /// Parent Type: `Nomen`
        public struct Name: PomoshAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.Nomen }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("fullName", String.self),
          ] }

          /// Полное имя (Имя Отчество Фамилия)
          public var fullName: String { __data["fullName"] }
        }

        /// WardById.PublicInformation.Photo
        ///
        /// Parent Type: `FileInformation`
        public struct Photo: PomoshAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.FileInformation }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("url", String.self, arguments: ["asAttachment": false]),
          ] }

          /// Ссылка для отображения или скачивания файла
          public var url: String { __data["url"] }
        }
      }
    }
  }
}
