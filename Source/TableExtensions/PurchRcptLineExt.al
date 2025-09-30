tableextension 50113 "Purch. Rcpt. Line Quality Ext" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50107; "Quality"; Enum ItemQuality)
        {
            Caption = 'Quality';
            DataClassification = CustomerContent;
        }
    }

}