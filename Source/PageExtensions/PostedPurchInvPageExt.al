pageextension 50106 "Posted Purch. Inv. Ext" extends "Posted Purchase Invoice"
{
    layout
    {
        addlast(General)
        {
            field("CRM No."; Rec."CRM No.")
            {
                ApplicationArea = All;
                Caption = 'CRM No.';
            }
        }
    }
}