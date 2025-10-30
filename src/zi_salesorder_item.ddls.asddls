@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Sales Order Items'

-- --- Core RAP Annotations ---
@ObjectModel.representativeKey: 'SalesOrderItem'
@ObjectModel.semanticKey: [ 'SalesOrderID', 'SalesOrderItem' ]

define root view entity ZI_SALESORDER_ITEM
  as select from zso_item

  -- --- This is the trial-safe reverse association to the Header ---
  association [1..1] to ZI_SALESORDER_HEADER as _Header
    on $projection.SalesOrderID = _Header.SalesOrderID
{
  key salesorderid   as SalesOrderID,
  key salesorderitem as SalesOrderItem,
      productname    as ProductName,
      quantity       as Quantity,
      created_by     as CreatedBy,
      created_at     as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt,

      -- --- Expose the association to be used in Fiori UIs ---
      _Header
}

