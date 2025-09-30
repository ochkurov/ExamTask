tableextension 50114 "Sales Shpt. Line Quality Ext" extends "Sales Shipment Line"
{
    fields
    {
        field(50108; "Quality"; Enum ItemQuality)
        {
            Caption = 'Quality';
            DataClassification = CustomerContent;
        }
    }

}