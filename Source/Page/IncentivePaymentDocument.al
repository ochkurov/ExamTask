page 50126 "Incentive Payment"
{
    PageType = Document;
    SourceTable = "Incentive Payment Header";
    Caption = 'Incentive Payment';
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field("SalesPerson"; Rec.SalesPerson) { ApplicationArea = All; }
                field("Posting Date"; Rec."Posting Date") { ApplicationArea = All; }
                field("Period Start"; Rec."Period Begin") { ApplicationArea = All; }
                field("Period End"; Rec."Period End") { ApplicationArea = All; }
                field("Status"; Rec.Status) { ApplicationArea = All; }
            }

            part(Lines; "Incentive Payment Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                Caption = 'Post';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    CalculateCodeUnit: Codeunit "Incentive Payment Calculate";
                begin
                    CalculateCodeUnit.Run(Rec)
                end;
            }
        }
    }

}