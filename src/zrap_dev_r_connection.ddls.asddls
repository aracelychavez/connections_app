@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Read-Only E2E: Data Model Flight'
@UI.headerInfo: { typeName: 'Connection',
                  typeNamePlural: 'Connections' }

define view entity ZRAP_DEV_R_CONNECTION
  as select from /dmo/connection as Connection
{
        @UI.facet: [{
         id: 'Connection',
         purpose:  #STANDARD,
         type:     #IDENTIFICATION_REFERENCE,
         label:    'Connection',
         position: 10 } ]

        @UI.lineItem: [ { position: 10, label: 'Airline'} ]
        @UI: { identification:[ { position: 10, label: 'Airline' } ] }
  key   Connection.carrier_id      as AirlineID,
        @UI.lineItem: [ { position: 20, label:'Connection Number' } ]
        @UI: { identification:[ { position: 20, label: 'Connection Number' } ] }
  key   Connection.connection_id   as ConnectionID,
        @UI.lineItem: [ { position: 40 , label: 'Destination Airport Code'}  ]
        @UI: { identification:[ { position: 30, label: 'Departure Airport Code'} ] }
        @UI.selectionField: [ { position: 10 } ]
        Connection.airport_from_id as DepartureAirport,
        @UI.lineItem: [ { position: 40 , label: 'Destination Airport Code'} ]
        @UI: { identification:[ { position: 40, label: 'Destination Airport Code'} ] }
        @UI.selectionField: [ { position: 20 } ]
        Connection.airport_to_id   as DestinationAirport,
        @UI.lineItem: [ { position: 50 , label: 'Departure Time'} ]
        @UI: { identification:[ { position: 50, label: 'Departure Time' } ] }
        Connection.departure_time  as DepartureTime,
        @UI.lineItem: [ { position: 60 ,  label: 'Arrival Time' } ]
        @UI: { identification:[ { position: 60, label: 'Arrival Time'  } ] }
        Connection.arrival_time    as ArrivalTime,
        @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
        @UI: { identification:[ { position: 70, label: 'Distance' } ] }
        Connection.distance        as Distance, //** secondary information, not to be displayed on list report entry page
        Connection.distance_unit   as DistanceUnit //** secondary information, not to be displayed on list report entry page
}
