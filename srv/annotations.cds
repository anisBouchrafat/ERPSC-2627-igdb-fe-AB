using GameService as service from './game-service';

annotate service.Student with @odata.draft.enabled;

annotate service.Student with @(
    UI.HeaderInfo         : {
        TypeName      : 'Student',
        TypeNamePlural: 'Students',
        Title         : {Value: First_name},
        Description   : {Value: Last_name}
    },
    UI.SelectionFields    : [
        First_name,
        Last_name
    ],
    UI.LineItem           : [
        {
            Value: First_name,
            Label: 'First name'
        },
        {
            Value: Last_name,
            Label: 'Last name'
        }
    ],
    UI.FieldGroup #General: {Data: [
        {
            Value: First_name,
            Label: 'First name'
        },
        {
            Value: Last_name,
            Label: 'Last name'
        }
    ]},
    UI.Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Student',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Favorite games',
            Target: 'to_favos/@UI.LineItem'
        }
    ]
);

annotate service.FavoriteGame with @(UI.LineItem: [
    {
        Value: Game_ID,
        Label: 'Game'
    },
    {
        Value: to_game.Genre,
        Label: 'Genre'
    },
    {
        Value: to_game.Platform,
        Label: 'Platform'
    }
]);

annotate service.FavoriteGame with {
    Game_ID @(
        Common.Label                   : 'Game',
        Common.Text                    : to_game.Name,
        Common.TextArrangement         : #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Game',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Game_ID,
                    ValueListProperty: 'Game_ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Name'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Genre'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Platform'
                }
            ]
        }
    );
};
