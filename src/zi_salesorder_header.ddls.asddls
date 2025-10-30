@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Sales Order Header'

@ObjectModel.representativeKey: 'SalesOrderID'
@ObjectModel.semanticKey: [ 'SalesOrderID' ]

define root view entity ZI_SALESORDER_HEADER
  as select from zso_header
{
  key salesorderid as SalesOrderID,
  customername     as CustomerName,
  orderdate        as OrderDate,
  created_by       as CreatedBy,
  created_at       as CreatedAt,
  last_changed_by  as LastChangedBy,
  last_changed_at  as LastChangedAt
}
