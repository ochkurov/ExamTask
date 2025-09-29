pageextension 50101 PurchaseOrderExt extends "Purchase Order"
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