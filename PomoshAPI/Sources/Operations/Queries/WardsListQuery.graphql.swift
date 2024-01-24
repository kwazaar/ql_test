// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WardsListQuery: GraphQLQuery {
  public static let operationName: String = "WardsList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query WardsList { wards { __typename edges { __typename node { __typename id publicInformation { __typename name { __typename displayName } photo { __typename url(asAttachment: false) id } } } } } }"#
    ))

  public init() {}

  public struct Data: PomoshAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wards", Wards?.self),
    ] }

    /// Подопечные
    public var wards: Wards? { __data["wards"] }

    /// Wards
    ///
    /// Parent Type: `WardsConnection`
    public struct Wards: PomoshAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.WardsConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("edges", [Edge]?.self),
      ] }

      /// A list of edges.
      public var edges: [Edge]? { __data["edges"] }

      /// Wards.Edge
      ///
      /// Parent Type: `WardsEdge`
      public struct Edge: PomoshAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.WardsEdge }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("node", Node.self),
        ] }

        /// The item at the end of the edge.
        public var node: Node { __data["node"] }

        /// Wards.Edge.Node
        ///
        /// Parent Type: `Ward`
        public struct Node: PomoshAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.Ward }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", PomoshAPI.ID.self),
            .field("publicInformation", PublicInformation.self),
          ] }

          /// Уникальный идентификатор
          public var id: PomoshAPI.ID { __data["id"] }
          /// Общедоступная информация о подопечном
          public var publicInformation: PublicInformation { __data["publicInformation"] }

          /// Wards.Edge.Node.PublicInformation
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

            /// Wards.Edge.Node.PublicInformation.Name
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

            /// Wards.Edge.Node.PublicInformation.Photo
            ///
            /// Parent Type: `FileInformation`
            public struct Photo: PomoshAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.FileInformation }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("url", String.self, arguments: ["asAttachment": false]),
                .field("id", String.self),
              ] }

              /// Ссылка для отображения или скачивания файла
              public var url: String { __data["url"] }
              /// Идентификатор файла
              public var id: String { __data["id"] }
            }
          }
        }
      }
    }
  }
}
