page 50125 "Incentive Payment List"
{
    PageType = List;
    SourceTable = "Incentive Payment Header";
    Caption = 'Incentive Payments';
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;
    CardPageId = "Incentive Payment";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { }
                field("Posting Date"; Rec."Posting Date") { }
                field("Period Begin"; Rec."Period Begin") { }
                field("Period End"; Rec."Period End") { }
                field(Status; Rec.Status) { }
            }
        }
    }
}
