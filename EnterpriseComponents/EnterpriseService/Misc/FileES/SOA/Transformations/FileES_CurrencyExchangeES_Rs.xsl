<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:fileeo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:currexeo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/CurrencyExchange/V1"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd currexeo fileeo xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:es="http://xmlns.equitybank.co.ke/ESB/ES/Transactions/CurrencyExchange/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/ES/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseServices/Transactions/CurrencyExchange/V1/CurrencyExchangeES.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/CurrencyExchange/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/FileESWrapper.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [TUE MAY 12 16:30:13 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <fileeo:ESBMsg>
      <xsl:if test="/currexeo:ESBMsg/com:MsgID">
        <com:MsgID>
          <xsl:value-of select="/currexeo:ESBMsg/com:MsgID"/>
        </com:MsgID>
      </xsl:if>
      <xsl:if test="/currexeo:ESBMsg/com:Source">
        <com:Source>
          <xsl:value-of select="/currexeo:ESBMsg/com:Source"/>
        </com:Source>
      </xsl:if>
      <xsl:if test="/currexeo:ESBMsg/com:MsgType">
        <com:MsgType>
          <xsl:value-of select="/currexeo:ESBMsg/com:MsgType"/>
        </com:MsgType>
      </xsl:if>
      <xsl:if test="/currexeo:ESBMsg/com:Service">
        <com:Service>
          <xsl:value-of select="/currexeo:ESBMsg/com:Service"/>
        </com:Service>
      </xsl:if>
      <xsl:if test="/currexeo:ESBMsg/currexeo:RsData">
        <fileeo:RsData>
          <fileeo:File>
            <fileeo:Payload>
              <xsl:copy-of select="/currexeo:ESBMsg/currexeo:RsData/currexeo:CurrencyExchange"/>
            </fileeo:Payload>
          </fileeo:File>
          <xsl:if test="/currexeo:ESBMsg/currexeo:RsData/com:Status">
            <com:Status>
              <xsl:if test="/currexeo:ESBMsg/currexeo:RsData/com:Status/com:Code">
                <com:Code>
                  <xsl:value-of select="/currexeo:ESBMsg/currexeo:RsData/com:Status/com:Code"/>
                </com:Code>
              </xsl:if>
              <xsl:if test="/currexeo:ESBMsg/currexeo:RsData/com:Status/com:Type">
                <com:Type>
                  <xsl:value-of select="/currexeo:ESBMsg/currexeo:RsData/com:Status/com:Type"/>
                </com:Type>
              </xsl:if>
              <xsl:if test="/currexeo:ESBMsg/currexeo:RsData/com:Status/com:Text">
                <com:Text>
                  <xsl:value-of select="/currexeo:ESBMsg/currexeo:RsData/com:Status/com:Text"/>
                </com:Text>
              </xsl:if>
            </com:Status>
          </xsl:if>
        </fileeo:RsData>
      </xsl:if>
    </fileeo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>