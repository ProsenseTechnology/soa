xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace xq="http://www.w3.org/2005/xquery-local-functions";

declare namespace com = "http://xmlns.equitybank.co.ke/ESB/EO/Common/V1";

declare variable $ESBMsgInput as element() external;
declare variable $ESBMsgResponse as element() external;

declare function xq:MapESBHeader($ESBMsgInput as element(), 
                                 $ESBMsgResponse as element() ) 
                                 as element() {
 let $resp:=
(   element {node-name($ESBMsgResponse)}
        {
        if ($ESBMsgInput/com:MsgID)
            then
          element com:MsgID{   fn:data($ESBMsgInput/com:MsgID)
            
        }else (),
        if ($ESBMsgInput/com:Source)
            then
      element com:Source  {
             fn:data($ESBMsgInput/com:Source)
            
        }else (), 
        if ($ESBMsgInput/com:MsgType)
            then
        element com:MsgType
        {
            fn:data($ESBMsgInput/com:MsgType)
           
        } else (),
        if ($ESBMsgInput/com:Service)
            then
         element com:Service
        {
             fn:data($ESBMsgInput/com:Service)
           
        } else (),
        if ($ESBMsgResponse/*[local-name()='RsData']/*)
            then
        element {node-name($ESBMsgResponse/*[local-name()='RsData'])}
        {
             $ESBMsgResponse/*[local-name()='RsData']/*
           
        } else ()
  }  
 )  
 return $resp
};

xq:MapESBHeader($ESBMsgInput, $ESBMsgResponse)
