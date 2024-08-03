using { sap.capire.incidents as my } from '../db/schema';
using { CATALOG } from './external/CATALOG';

service ProcessorService { 
    entity Incidents as projection on my.Incidents;
    entity ServiceCollection1 as select from CATALOG.ServiceCollection {
      ID,
      Description,
      Title,
      TechnicalServiceName
    }

    @readonly
    entity Customers as projection on my.Customers;
}

extend projection ProcessorService.Customers with {
  firstName || ' ' || lastName as name: String
}

annotate ProcessorService.Incidents with @odata.draft.enabled;
annotate ProcessorService with @(requires: 'support');