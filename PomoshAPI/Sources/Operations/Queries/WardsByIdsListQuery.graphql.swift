// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WardsByIdsListQuery: GraphQLQuery {
  public static let operationName: String = "WardsByIdsList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query WardsByIdsList($listId: [ID!]!) { wardsByIds(ids: $listId) { __typename publicInformation { __typename name { __typename displayName } photo { __typename url(asAttachment: false) } } } }"#
    ))

  public var listId: [ID]

  public init(listId: [ID]) {
    self.listId = listId
  }

  public var __variables: Variables? { ["listId": listId] }

  public struct Data: PomoshAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wardsByIds", [WardsById?].self, arguments: ["ids": .variable("listId")]),
    ] }

    /// Список подопечных для указанных идентификаторов
    public var wardsByIds: [WardsById?] { __data["wardsByIds"] }

    /// WardsById
    ///
    /// Parent Type: `Ward`
    public struct WardsById: PomoshAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.Ward }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("publicInformation", PublicInformation.self),
      ] }

      /// Общедоступная информация о подопечном
      public var publicInformation: PublicInformation { __data["publicInformation"] }

      /// WardsById.PublicInformation
      ///
      /// Parent Type: `WardPublicInformation`
      public struct PublicInformation: PomoshAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.WardPublicInformation }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", Name.self),
          .field("photo", Photo.self),
        ] }

        /// Имя
        public var name: Name { __data["name"] }
        /// Фотография подопечного
        public var photo: Photo { __data["photo"] }

        /// WardsById.PublicInformation.Name
        ///
        /// Parent Type: `Nomen`
        public struct Name: PomoshAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.Nomen }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("displayName", String.self),
          ] }

          /// Имя для отображения (Имя Фамилия)
          public var displayName: String { __data["displayName"] }
        }

        /// WardsById.PublicInformation.Photo
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
