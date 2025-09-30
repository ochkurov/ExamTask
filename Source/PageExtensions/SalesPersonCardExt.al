pageextension 50123 SalespersonCardExt extends "Salesperson/Purchaser Card"
{
    layout
    {
        addlast(General)
        {
            field("Salary Amount"; Rec."Salary Amount")
            {
                ApplicationArea = All;
            }
            field("Incentive Amount"; Rec."Incentive Amount")
            {
                ApplicationArea = All;
            }
        }
    }

}