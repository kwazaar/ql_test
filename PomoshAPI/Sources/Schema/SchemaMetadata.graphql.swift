// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == PomoshAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == PomoshAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == PomoshAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == PomoshAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return PomoshAPI.Objects.Query
    case "WardsConnection": return PomoshAPI.Objects.WardsConnection
    case "WardsEdge": return PomoshAPI.Objects.WardsEdge
    case "Ward": return PomoshAPI.Objects.Ward
    case "WardPublicInformation": return PomoshAPI.Objects.WardPublicInformation
    case "Nomen": return PomoshAPI.Objects.Nomen
    case "FileInformation": return PomoshAPI.Objects.FileInformation
    case "FileUploadInformation": return PomoshAPI.Objects.FileUploadInformation
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
