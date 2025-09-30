pageextension 50116 "Sales Order Subform Ext" extends "Sales Order Subform"
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