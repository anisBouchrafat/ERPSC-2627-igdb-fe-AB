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
        Value: to_game.Name,
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
