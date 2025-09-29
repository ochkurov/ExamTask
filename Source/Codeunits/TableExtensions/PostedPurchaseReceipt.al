tableextension 50103 "Purch. Rcpt. Header Ext" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50101; "CRM No."; Code[20])
        {
            Caption = 'CRM No.';
            DataClassification = CustomerContent;
        }
    }
}