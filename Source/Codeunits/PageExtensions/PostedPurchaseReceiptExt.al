pageextension 50104 "Posted Purchase Receipt Ext" extends "Posted Purchase Receipt"
{
    layout
    {
        addlast(General)
        {
            field("CRM No."; Rec."CRM No.")
            {
                Caption = 'CRM No.';
                ApplicationArea = All;
            }
        }
    }
}