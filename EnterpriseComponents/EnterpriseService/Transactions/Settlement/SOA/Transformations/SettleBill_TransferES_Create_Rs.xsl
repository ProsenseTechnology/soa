<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Settlement/V1"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns1 ns0 oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:ns3="http://xmlns.equitybank.co.ke/ESB/ES/Transactions/Transfer/V1" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1" xmlns:es="http://xmlns.equitybank.co.ke/ESB/ES/Transactions/Settlement/V1">
    <oracle-xsl-mapper:schema>
        <oracle-xsl-mapper:mapSources>
            <oracle-xsl-mapper:source type="WSDL">
                <oracle-xsl-mapper:schema location="../WSDLs/Settlement.wsdl"/>
                <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Settlement/V1"/>
            </oracle-xsl-mapper:source>
            <oracle-xsl-mapper:source type="WSDL">
                <oracle-xsl-mapper:schema location="../WSDLs/TransferES.wsdl"/>
                <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
                <oracle-xsl-mapper:param name="InvokeTransferESOutputVariable.payload"/>
            </oracle-xsl-mapper:source>
            <oracle-xsl-mapper:source type="WSDL">
                <oracle-xsl-mapper:schema location="../WSDLs/Settlement.wsdl"/>
                <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Settlement/V1"/>
                <oracle-xsl-mapper:param name="recordCounter"/>
            </oracle-xsl-mapper:source>
        </oracle-xsl-mapper:mapSources>
        <oracle-xsl-mapper:mapTargets>
            <oracle-xsl-mapper:target type="WSDL">
                <oracle-xsl-mapper:schema location="../WSDLs/Settlement.wsdl"/>
                <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Settlement/V1"/>
            </oracle-xsl-mapper:target>
        </oracle-xsl-mapper:mapTargets>
    </oracle-xsl-mapper:schema>
    <xsl:param name="InvokeTransferESOutputVariable.payload"/>
    <xsl:param name="recordCounter"/>
    <xsl:template match="/">
        <ns0:ESBMsg>
            <ns0:RsData>
                <ns0:Transfer>
                    <ns0:ID>
                        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Transfer[number($recordCounter/ns0:ESBMsg)]/ns0:ID"/>
                    </ns0:ID>
                    <ns2:Amount>
                        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Transfer[number($recordCounter/ns0:ESBMsg)]/ns2:Amount"/>
                    </ns2:Amount>
                    <ns0:RefKey>
                        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Transfer[number($recordCounter/ns0:ESBMsg)]/ns0:RefKey"/>
                    </ns0:RefKey>
                    <ns0:UserGroup>
                        <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/ns0:Transfer[number($recordCounter/ns0:ESBMsg)]/ns0:UserGroup"/>
                    </ns0:UserGroup>
                    <ns2:Status>
                        <xsl:choose>
                            <xsl:when test="xp20:lower-case($InvokeTransferESOutputVariable.payload/ns1:ESBMsg/ns1:RsData/ns2:Status/ns2:Type) = 'success'">
                                <ns2:Code>0</ns2:Code>
                            </xsl:when>
                            <xsl:otherwise>
                                <ns2:Code>2</ns2:Code>
                            </xsl:otherwise>
                        </xsl:choose>
                        <ns2:Type>
                            <xsl:value-of select="$InvokeTransferESOutputVariable.payload/ns1:ESBMsg/ns1:RsData/ns2:Status/ns2:Type"/>
                        </ns2:Type>
                        <ns2:Text>
                            <xsl:value-of select="$InvokeTransferESOutputVariable.payload/ns1:ESBMsg/ns1:RsData/ns2:Status/ns2:Text"/>
                        </ns2:Text>
                    </ns2:Status>
                </ns0:Transfer>
            </ns0:RsData>
        </ns0:ESBMsg>
    </xsl:template>
</xsl:stylesheet>
