xquery version "1.0" encoding "UTF-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace soap = "http://www.w3.org/2003/05/soap-envelope";
declare namespace ctx = "http://www.bea.com/wli/sb/context";
declare namespace tp = "http://www.bea.com/wli/sb/transports";
declare namespace http = "http://www.bea.com/wli/sb/transports/http";
declare namespace xq="http://www.w3.org/2005/xquery-local-functions";
declare namespace conf = "http://www.bea.com/wli/sb/stages/transform/config";
declare namespace com = "http://xmlns.equitybank.co.ke/ESB/EO/Common/V1";



declare variable $OSBFault as element(ctx:fault) external;

declare function xq:MapESBStatus($OSBFault as element(ctx:fault))
as element(soap:Fault)
{
<soap:Fault>
{
<soap:Code><soap:Value>soap:Receiver</soap:Value></soap:Code>
}
{
if ($OSBFault/ctx:errorCode="OSB-380002")
then <soap:Reason>
            <soap:Text xml:lang="en">{fn:concat('ESB-500150',':',$OSBFault/ctx:reason)}</soap:Text>
         </soap:Reason>
         else 
         <soap:Reason>
            <soap:Text xml:lang="en">{fn:concat('ESB-500152',':',$OSBFault/ctx:reason)}</soap:Text>
         </soap:Reason>
}
<soap:Detail>
<con:fault xmlns:con="http://www.bea.com/wli/sb/context">
{
if ($OSBFault/ctx:errorCode="OSB-380002")
then <con:errorCode>{   fn:data('ESB-500150')}</con:errorCode>
else <con:errorCode>{   fn:data('ESB-500152')}</con:errorCode>
}
{
if ($OSBFault/ctx:errorCode="OSB-380002")
then <con:reason>{fn:concat('Internal Server Error','(',$OSBFault/ctx:reason,')')}</con:reason>
else <con:reason>{fn:concat($OSBFault/ctx:reason,'(',$OSBFault/ctx:details,')')}</con:reason>
}
{
if ($OSBFault/ctx:location)
then <con:location>{   fn:data($OSBFault/ctx:location)}</con:location>
else <con:location/>
}
{
if ($OSBFault/ctx:details)
then <con:details>{   fn:data($OSBFault/ctx:details)}</con:details>
else <con:details/>
}
</con:fault>
</soap:Detail>
</soap:Fault>
};

xq:MapESBStatus($OSBFault)