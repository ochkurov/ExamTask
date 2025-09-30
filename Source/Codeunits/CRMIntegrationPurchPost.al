codeunit 50107 "CRM No. Posting SubscriberS"
{
    Subtype = Normal;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchRcptHeaderInsert', '', true, true)]
    local procedure OnBeforePurchRcptHeaderInsert(
        var PurchRcptHeader: Record "Purch. Rcpt. Header";
        PurchaseHeader: Record "Purchase Header")
    begin
        PurchRcptHeader.Validate("CRM No.", PurchaseHeader."CRM No.");
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchInvHeaderInsert', '', true, true)]
    local procedure OnBeforePurchInvHeaderInsert(
    var PurchInvHeader: Record "Purch. Inv. Header";
    var PurchHeader: Record "Purchase Header";
    CommitIsSupressed: Boolean)
    begin
        PurchInvHeader.Validate("CRM No.", PurchHeader."CRM No.");
    end;



}