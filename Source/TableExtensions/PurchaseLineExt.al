tableextension 50111 "Purchase Line Quality Ext" extends "Purchase Line"
{
    fields
    {
        field(50105; "Quality"; Enum ItemQuality)
        {
            Caption = 'Quality';
            DataClassification = CustomerContent;
        }
    }
}