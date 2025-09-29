tableextension 50100 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50100; "CRM No."; Code[20])
        {
            Caption = 'CRM No.';
            DataClassification = CustomerContent;
        }
    }
}