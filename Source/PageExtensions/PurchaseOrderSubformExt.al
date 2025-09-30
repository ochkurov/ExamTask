pageextension 50115 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Quality"; Rec."Quality")
            {
                ApplicationArea = All;
                Caption = 'Quality';
            }
        }
    }
}