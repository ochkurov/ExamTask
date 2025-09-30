table 50119 "Incentive Setup"
{
    Caption = 'Incentive Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Salespersone Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser".Code;

        }
        field(2; "Product Group Code"; Code[20])
        {
            Caption = 'Product Group Code';
            TableRelation = "Item Category".Code;
        }

        field(3; "Incentive Percent"; Decimal)
        {
            Caption = 'Incentive Percent';
            DecimalPlaces = 0 : 5;
        }
    }

    keys
    {
        key(PK; "Salespersone Code")
        {
            Clustered = true;
        }
    }
}