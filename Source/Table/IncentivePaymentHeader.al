table 50124 "Incentive Payment Header"
{
    DataClassification = CustomerContent;
    Caption = 'Incentive Payment Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "SalesPerson"; Code[20])
        {
            Caption = 'SalesPerson';
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Period Begin"; Date)
        {
            Caption = 'Period Begin';
        }
        field(5; "Period End"; Date)
        {
            Caption = 'Period End';
        }
        field(6; Status; Enum "Incentive Payment Status")
        {
            Caption = 'Status';
            InitValue = Open;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}