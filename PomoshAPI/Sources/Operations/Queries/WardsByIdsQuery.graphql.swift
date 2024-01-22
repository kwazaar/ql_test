// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class WardsByIdsQuery: GraphQLQuery {
  public static let operationName: String = "WardsByIds"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query WardsByIds { wardsIds }"#
    ))

  public init() {}

  public struct Data: PomoshAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PomoshAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("wardsIds", [PomoshAPI.ID].self),
    ] }

    /// Идентификаторы всех подопечных
    public var wardsIds: [PomoshAPI.ID] { __data["wardsIds"] }
  }
}
