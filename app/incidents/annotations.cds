using ProcessorService as service from '../../srv/processor-service';
using from '../../db/schema';
annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Customer',
                Value : customer_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'urgency_code',
                Value : urgency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status_code',
                Value : status_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Overview}',
            ID : 'i18nOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Details}',
                    ID : 'i18nDetails',
                    Target : '@UI.FieldGroup#i18nDetails',
                },],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Conversation}',
            ID : 'i18nConversation',
            Target : 'conversation/@UI.LineItem#i18nConversation',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'customer_ID',
            Value : customer_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : customer.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Label : 'urgency_code',
            Value : urgency_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status_code',
            Value : status_code,
            Criticality : status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : status.descr,
        },
        {
            $Type : 'UI.DataField',
            Value : urgency.descr,
        },
    ],
);

annotate service.Incidents with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'firstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'lastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};

annotate service.Incidents with @(
    UI.SelectionFields : [
        status_code,
        urgency_code,
    ]
);
annotate service.Incidents with {
    status @Common.Label : 'Status'
};
annotate service.Incidents with {
    urgency @Common.Label : '{i18n>Urgency}'
};
annotate service.Incidents with {
    status @Common.ValueListWithFixedValues : true
};
annotate service.Status with {
    code @Common.Text : descr
};
annotate service.Incidents with {
    urgency @Common.ValueListWithFixedValues : true
};
annotate service.Urgency with {
    code @Common.Text : descr
};
annotate service.Incidents with @(
    UI.HeaderInfo : {
        TypeImageUrl : 'sap-icon://alert',
        TypeName : '',
        TypeNamePlural : '',
    }
);
annotate service.Incidents with @(
    UI.FieldGroup #i18nDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status_code,
            },{
                $Type : 'UI.DataField',
                Value : urgency_code,
            },],
    }
);
annotate service.Incidents with {
    customer @Common.Text : {
            $value : customer.name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Incidents with {
    customer @Common.ValueListWithFixedValues : true
};
annotate service.Incidents.conversation with @(
    UI.LineItem #i18nConversation : [
        {
            $Type : 'UI.DataField',
            Value : author,
        },{
            $Type : 'UI.DataField',
            Value : message,
            Label : 'message',
        },{
            $Type : 'UI.DataField',
            Value : timestamp,
        },]
);
