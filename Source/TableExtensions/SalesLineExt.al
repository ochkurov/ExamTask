tableextension 50112 "Sales Line Quality Ext" extends "Sales Line"
{
    fields
    {
        field(50106; "Quality"; Enum ItemQuality)
        {
            Caption = 'Quality';
            DataClassification = CustomerContent;
        }
    }
}