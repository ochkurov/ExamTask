table 50125 "Incentive Payment Line"
{
    Caption = 'Incentive Payment Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
        }
        field(3; "Incentive Amount"; Decimal)
        {
            Caption = 'Incentive Amount';
        }
        field(4; "Salary Amount"; Decimal)
        {
            Caption = 'Salary Amount';
        }
        field(5; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
        }
    }

    keys
    {
        key(PK; "Document No.", "Salesperson Code")
        {
            Clustered = true;
        }
    }
}