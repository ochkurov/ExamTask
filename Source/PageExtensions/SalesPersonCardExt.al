pageextension 50123 SalespersonCardExt extends "Salesperson/Purchaser Card"
{
    layout
    {
        addafter(Invoicing)
        {
            group(Salary)
            {
                Caption = 'Salary';
                field("Salary Amount"; Rec."Salary Amount")
                {
                    ApplicationArea = All;
                }
                field("Commission"; Rec."Commission %")
                {
                    ApplicationArea = All;
                }
                field("Incentive Amount"; Rec."Incentive Amount")
                {
                    ApplicationArea = All;
                }

            }
        }
        modify("Commission %")
        {
            Visible = false;
        }
    }
}