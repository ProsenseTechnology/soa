xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace xq="http://www.w3.org/2005/xquery-local-functions";
declare namespace ctx = "http://www.bea.com/wli/sb/context";
declare namespace tp = "http://www.bea.com/wli/sb/transports";
declare namespace http = "http://www.bea.com/wli/sb/transports/http";
declare namespace conf = "http://www.bea.com/wli/sb/stages/transform/config";
declare namespace com = "http://xmlns.equitybank.co.ke/ESB/EO/Common/V1";
declare variable $OSBFault as element() external;
declare variable $PayLoadMsg as element() external;
declare function xq:MapESBStatus($OSBFault as element(), 
                                 $PayLoadMsg as element())
as element(){
 let $resp:=
(   element {node-name($PayLoadMsg)}
        {
        element {QName(namespace-uri($PayLoadMsg/*[local-name()='RqData']),'eo:RsData')}
        {
        element com:Status
        {
        if ($OSBFault/ctx:errorCode="OSB-382505")
            then
          element com:Code{   fn:data('ESB-500152')
            
        }else (),
        if ($OSBFault/ctx:errorCode="OSB-380000")
            then
          element com:Code{   fn:data('ESB-500150')
            
        }else (),
        if ($OSBFault/ctx:errorCode="OSB-380002")
            then
          element com:Code{   fn:data('ESB-999')
            
        }
        else ( element com:Code{   fn:data('ESB-999')}),
        if ($OSBFault/ctx:reason)
            then
      element com:Type  {
             fn:data($OSBFault/ctx:reason)
            
        }else (), 
         if ($OSBFault/ctx:details/conf:ValidationFailureDetail/conf:message)
            then
        element com:Text {
            fn:data($OSBFault/ctx:details/conf:ValidationFailureDetail/conf:message)
           
        } else ()
        }
        }
  }  
 )  
 return $resp
};

xq:MapESBStatus($OSBFault,$PayLoadMsg)
