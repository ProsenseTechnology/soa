xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace eo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Project/V1";
(:: import schema at "../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Resilience/Project/V1/ProjectEO.xsd" ::)
declare namespace db="http://xmlns.equitybank.co.ke/ESB/PS/EBiz/Adapter/db";
(:: import schema at "../../../Adapter/db/EBZ_DB_Adapter.xsd" ::)


declare namespace xqylocal="http://www.w3.org/2005/xquery-local-functions";

declare namespace com = "http://xmlns.equitybank.co.ke/ESB/EO/Common/V1";

declare variable $ProjectEOESBMsg as element() (:: schema-element(eo:ESBMsg) ::) external;

declare function xqylocal:CreateEBZ_ProjectPS_queryProjectCostRq.xqy($ProjectEOESBMsg as element() (:: schema-element(eo:ESBMsg) ::)) as element() (:: schema-element(db:QueryProjectCostInput) ::) {
    <db:QueryProjectCostInput>
        <db:startDate>{fn:data(fn-bea:date-to-string-with-format('dd-MMM-yy', xs:date($ProjectEOESBMsg/eo:RqData/eo:Project/com:StartDate)))}</db:startDate>
        <db:endDate>{fn:data(fn-bea:date-to-string-with-format('dd-MMM-yy', xs:date($ProjectEOESBMsg/eo:RqData/eo:Project/com:EndDate)))}</db:endDate></db:QueryProjectCostInput>
};

xqylocal:CreateEBZ_ProjectPS_queryProjectCostRq.xqy($ProjectEOESBMsg)