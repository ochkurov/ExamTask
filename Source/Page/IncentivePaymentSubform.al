page 50127 "Incentive Payment Subform"
{
    PageType = ListPart;
    SourceTable = "Incentive Payment Line";
    Caption = 'Incentive Payment Lines';
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field("Incentive Amount"; Rec."Incentive Amount")
                {
                    ApplicationArea = All;
                }
                field("Salary Amount"; Rec."Salary Amount")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
