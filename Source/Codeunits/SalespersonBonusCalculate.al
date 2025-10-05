codeunit 50124 SalespersonBonusCalculate
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterSalesInvLineInsert, '', false, false)]
    local procedure OnAfterSalesInvLineInsert(
         var SalesInvLine: Record "Sales Invoice Line";
            SalesInvHeader: Record "Sales Invoice Header";
            SalesLine: Record "Sales Line"
    )
    var
        IncentiveLedger: Record "Incentive Ledger Entry";
        IncentivePercent: Decimal; // Percentage of sales amount , used to calculate the managers incentive.
        IncentiveAmount: Decimal; // Calculated incentive amount for the current sales invoice line.
    begin
        if SalesLine.Type <> SalesLine.Type::Item then
            exit;
        if SalesInvHeader."Salesperson Code" = '' then
            exit;


        IncentiveAmount := SalesInvLine."Amount Including VAT" * GetCommissionPercent(SalesInvHeader."Salesperson Code", SalesInvLine."Item Category Code") / 100;
        if IncentiveAmount = 0 then
            exit;
        IncentiveLedger.Init();
        IncentiveLedger."Document Type" := "Document Type Enum"::"Sales Invoice";
        IncentiveLedger."Document No." := SalesInvHeader."No.";
        IncentiveLedger."Posting Date" := SalesInvHeader."Posting Date";
        IncentiveLedger."Salesperson Code" := SalesInvHeader."Salesperson Code";
        IncentiveLedger.Amount := IncentiveAmount;
        IncentiveLedger.Insert(true);
    end;

    local procedure GetCommissionPercent(SalesPersonCode: Code[20]; ItemCategoryCode: Code[20]): Decimal
    var
        IncentiveSetup: Record "Incentive Setup";
        Salesperson: Record "Salesperson/Purchaser";
    begin
        if IncentiveSetup.Get(SalesPersonCode, ItemCategoryCode) then
            exit(IncentiveSetup."Incentive Percent");
        if IncentiveSetup.Get('', ItemCategoryCode) then
            exit(IncentiveSetup."Incentive Percent");
        if Salesperson.Get(SalesPersonCode) then
            exit(Salesperson."Commission %");
    end;
}