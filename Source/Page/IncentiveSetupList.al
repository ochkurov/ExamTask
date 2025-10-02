page 50120 "Incentive Setup List"
{
    PageType = List;
    Caption = 'Incentive Setup';
    ApplicationArea = All;
    SourceTable = "Incentive Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Salesperson Code"; Rec."Salespersone Code")
                {
                    ApplicationArea = All;
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    ApplicationArea = All;
                }
                field("Incentive Percent"; Rec."Incentive Percent")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}