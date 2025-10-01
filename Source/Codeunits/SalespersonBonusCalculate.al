codeunit 50124 SalespersonBonusCalculate
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterSalesInvLineInsert, '', false, false)]
    local procedure OnAfterSalesInvLineInsert(
         var SalesInvLine: Record "Sales Invoice Line";
            SalesInvHeader: Record "Sales Invoice Header";
            SalesLine: Record "Sales Line"
    )
    var
        IncentiveSetup: Record "Incentive Setup";
        Salesperson: Record "Salesperson/Purchaser";
        IncentiveLedger: Record "Incentive Ledger Entry";
        IncentivePercent: Decimal; // Percentage of sales amount , used to calculate the managers incentive.
        IncentiveAmount: Decimal; // Calculated incentive amount for the current sales invoice line.
    begin
        if SalesInvHeader."Salesperson Code" = '' then
            exit;
        Salesperson.Get(SalesInvHeader."Salesperson Code");
        if IncentiveSetup.Get(SalesInvHeader."Salesperson Code", SalesLine."Item Category Code") then
            IncentivePercent := IncentiveSetup."Incentive Percent"
        else
            IncentivePercent := Salesperson."Commission %";
        IncentiveAmount := SalesInvLine."Amount Including VAT" * IncentivePercent / 100;
        IncentiveLedger.Init();
        IncentiveLedger."Document Type" := "Document Type Enum"::"Sales Invoice";
        IncentiveLedger."Posting Date" := SalesInvHeader."Posting Date";
        IncentiveLedger."Salesperson Code" := SalesInvHeader."Salesperson Code";
        IncentiveLedger."Document No." := SalesInvHeader."No.";
        IncentiveLedger.Amount := IncentiveAmount;
        IncentiveLedger.Insert();

    end;
}