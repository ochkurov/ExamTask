tableextension 50105 "Purch. Inv. Header Ext" extends "Purch. Inv. Header"
{
    fields
    {
        field(50102; "CRM No."; Code[20])
        {
            Caption = 'CRM No.';
            DataClassification = CustomerContent;
        }
    }
}