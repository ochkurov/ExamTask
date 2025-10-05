table 50121 "Incentive Ledger Entry"
{
    Caption = 'Incentive Ledger Entry';
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(2; "Document Type"; Enum "Document Type Enum")
        {
            Caption = 'Document Type';
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }

        field(4; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }

        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }

        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
            DecimalPlaces = 0 : 2;
        }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}
