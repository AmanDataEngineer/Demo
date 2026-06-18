[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "GeographyDimension_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared GeographyDimension = let
  Source = Sql.Databases("localhost"),
  #"Navigation 1" = Source{[Name = "sindhu_Aggregation_Case"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "dbo", Item = "GeographyDimension"]}[Data]
in
  #"Navigation 2";
shared SalesFact_Aggregation_Region = let
  Source = Sql.Databases("localhost"),
  #"Navigation 1" = Source{[Name = "sindhu_Aggregation_Case"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "dbo", Item = "SalesFact_Aggregation_Region"]}[Data]
in
  #"Navigation 2";
shared SalesFactGeo = let
  Source = Sql.Databases("localhost"),
  #"Navigation 1" = Source{[Name = "sindhu_Aggregation_Case"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "dbo", Item = "SalesFactGeo"]}[Data]
in
  #"Navigation 2";
shared GeographyDimension_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "fa681d93-47f5-429d-aad1-1f8bbbad0a6a"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "6489548b-c781-4b8b-814c-19d3a55f3d76"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "GeographyDimension", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
