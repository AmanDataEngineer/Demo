[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "fa681d93-47f5-429d-aad1-1f8bbbad0a6a"]}[Data]{[lakehouseId = "64d2d0cb-0e92-4b36-be39-f555e9f90a9f"]}[Data];
[BindToDefaultDestination = true]
shared SalesFact = let
  Source = Sql.Databases("localhost"),
  #"Navigation 1" = Source{[Name = "sindhu_Aggregation_Case"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "dbo", Item = "SalesFact"]}[Data],
  #"Removed columns" = Table.RemoveColumns(#"Navigation 2", {"ProductDimension"})
in
  #"Removed columns";
[BindToDefaultDestination = true]
shared SalesFact_Aggregation_Region = let
  Source = Sql.Databases("localhost"),
  #"Navigation 1" = Source{[Name = "sindhu_Aggregation_Case"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "dbo", Item = "SalesFact_Aggregation_Region"]}[Data],
  #"Removed columns" = Table.RemoveColumns(#"Navigation 2", {"GeographyDimension(GeographyID)", "GeographyDimension(GeographyID) 2"})
in
  #"Removed columns";
[BindToDefaultDestination = true]
shared SalesFactGeo = let
  Source = Sql.Databases("localhost"),
  #"Navigation 1" = Source{[Name = "sindhu_Aggregation_Case"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Schema = "dbo", Item = "SalesFactGeo"]}[Data],
  #"Removed columns" = Table.RemoveColumns(#"Navigation 2", {"GeographyDimension"})
in
  #"Removed columns";
