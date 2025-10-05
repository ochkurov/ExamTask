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

        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(3; "Period Begin"; Date)
        {
            Caption = 'Period Begin';
        }
        field(4; "Period End"; Date)
        {
            Caption = 'Period End';
        }
        field(5; Status; Enum "Incentive Payment Status")
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